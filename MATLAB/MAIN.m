% BY:    MAHMOUD POURMEHRAB
% EMAIL: MPOURMEHRAB@UFL.EDU

% clc;
% clear;
% close('all');
% fclose('all');
% delete('*.bin');
% delete('*.png');

%% Run Modes
plot_traj = 0;
t_plot_traj = 0; % sec
profile_code = 0;

%% Create the bin and log dirs if they do not exist
if ~exist('BIN', 'dir')
    mkdir('BIN')
end

% TRAVEL TIME VALUES STORED
TTFile  =           fopen(['BIN' filesep 'scenario',num2str(sc),'_TT.bin'],'w');
% ARRIVAL VALUES STORED
ARFile  =           fopen(['BIN' filesep 'scenario',num2str(sc),'_AR.bin'],'w');
% SIGNAL VALUES STORED
SCFile  =           fopen(['BIN' filesep 'scenario',num2str(sc),'_SC.bin'],'w');


%% IMPORT/DEFINE VARIABLES REQUIRED TO RUN THE SIMULATION

perfMeasure  =  struct('LastThroughputByLane',zeros(1,intersectionConfig.NoOfLanes+1+1),...
    'LastArrival',zeros(1,intersectionConfig.NoOfLanes + 1));

% ESTIMATE THE LAG TIME FOR THE AN SLOW VEHICLE
oldVehIndx   = zeros(intersectionConfig.NoOfLanes,1); % THIS KEEPS WHERE LAST OLD VEHICLEIS IS PLACED IN MASTER VEHICLES STRUCTURE
existingVeh  = zeros(intersectionConfig.NoOfLanes,1);
tLag         = dr / max(intersectionConfig.safeSpeed); % rough approximation on tLag (in second)


%% ========================================================================
% Begin the Simulation!
%==========================================================================
simParameters.refFullTime           =   0;   % set the simulation time from VISSIM
Vissim.Simulation.RunSingleStep      ;      % if not, you caan't initialize signal

% initialize vehicle struct
vehicles = repmat(struct('vehID', '', 'type','','vehIndx','','initTime','',...
    'length','','maxAccRate','','maxDeccRate','','destination','',...
    'currSpeed','','desiredSpeed','','trajectory','',...
    'trajPointIndx','','commRange','','served','',...
    'trajReceived','','idealTraj','','distance',''...
    ), intersectionConfig.NoOfLanes, 1);

for lane = 1 : intersectionConfig.NoOfLanes
    vehicles(lane)               = struct(...
        'vehID',                   zeros(intersectionConfig.maxNo(lane).vehsPerLane, 1)...
        ,'type',                    zeros(intersectionConfig.maxNo(lane).vehsPerLane, 1)...
        ,'vehIndx',                 zeros(1,2)...
        ,'initTime',                zeros(intersectionConfig.maxNo(lane).vehsPerLane, 3)...
        ,'length',                  zeros(intersectionConfig.maxNo(lane).vehsPerLane, 1)...
        ,'maxAccRate',              zeros(intersectionConfig.maxNo(lane).vehsPerLane, 1)...
        ,'maxDeccRate',             zeros(intersectionConfig.maxNo(lane).vehsPerLane, 1)...
        ,'destination',             zeros(intersectionConfig.maxNo(lane).vehsPerLane, 1)...
        ,'currSpeed',               zeros(intersectionConfig.maxNo(lane).vehsPerLane, 1)...
        ,'desiredSpeed',            zeros(intersectionConfig.maxNo(lane).vehsPerLane, 1)...
        ,'trajectory',              {cell(intersectionConfig.maxNo(lane).vehsPerLane, 1)}...
        ,'trajPointIndx',           zeros(intersectionConfig.maxNo(lane).vehsPerLane, 2)...
        ,'commRange',               dr...
        ,'served',                  zeros(intersectionConfig.maxNo(lane).vehsPerLane, 1)...
        ,'trajReceived',            zeros(intersectionConfig.maxNo(lane).vehsPerLane, 1)...
        ,'idealTraj',               zeros(intersectionConfig.maxNo(lane).vehsPerLane, 7)...
        ,'distance',                zeros(intersectionConfig.maxNo(lane).vehsPerLane, 1));
    vehicles(lane).trajectory(:) = {zeros(intersectionConfig.maxNo(lane).trajPoints, 2)};
end

%% ========================================================================
% Signal Controller Phase and Timing Initialization
%==========================================================================
signal.nextPhasesSeq      = [1]; % PHASES CAME FROM THEORY
signal.nextPhasesG        = [tLag - intersectionConfig.Y];
signal.nextPhasesY        = [intersectionConfig.Y];
signal.nextPhasesAR       = [intersectionConfig.AR];

switchSignal( Vissim, 1, phasesLib(signal.nextPhasesSeq(1)).Lanes, 'GREEN' ); % possible values e.g. 'GREEN', 'RED', 'AMBER', 'REDAMBER'


%DO NOT RECORD THIS SIGNAL DECISION SINCE NO VEHICLE CAN USE IT
currFullTime              = simParameters.refFullTime;

% currFullTime  =  datetime('now');

%% MAIN CONTROL LOOP
timeIncrement = 1 / SimRes; % this would be the time step length to oush forward simulation


if plot_traj
    simParameters.fig   =   figure('Name','Trajectories per Lanes','NumberTitle','off','units','normalized','outerposition',[0 0 1 1],'Color','w');
end
if profile_code
    profile on
end

numVehs = 0;
currFullTime = Vissim.Simulation.SimulationSecond;
All_Vehicles    = Vissim.Net.Vehicles.GetAll; % get all vehicles in the network at the actual simulation second
VissimVehCount  = Vissim.Net.Vehicles.Count;
VISS_MAT_veh    = zeros(length(All_Vehicles), 6); % VISS Link, VISS Lane,

while  simParameters.globalTime < End_of_veh_input || ... % Termination Criteria
        numVehs         ~=          0
    
        %%     MONITOR AND UPDATE
    
    All_Vehicles    = Vissim.Net.Vehicles.GetAll; % get all vehicles in the network at the actual simulation second
    VissimVehCount  = Vissim.Net.Vehicles.Count;
    VISS_MAT_veh_Dummy    = zeros(length(All_Vehicles), 6);
    
    %     update the MATLAB knowledge about vehicles in VISSIM
    for ii = 1  :   VissimVehCount
        id = get(All_Vehicles{ii},'AttValue','No');
        LaneLink = sscanf(get(All_Vehicles{ii},'AttValue','Lane'),'%d',[1 2]);
        if length(LaneLink) == 1 % vehcicle is on connector
            VISS_MAT_veh_Dummy(ii, 5) = -1;
            continue
        elseif LaneLink(1) > intersectionConfig.NoOfLinks % vehicle is on a discharge link
            VISS_MAT_veh_Dummy(ii, 5) = -1;
            continue
        end
        lane = intersectionConfig.mapLink2Lane(LaneLink(1),-LaneLink(2));
        
        loc = find(VISS_MAT_veh(:,6) == id);
        if ~isempty(loc) % true if the vehicle was in matlab
            VISS_MAT_veh_Dummy(ii, :) = VISS_MAT_veh(loc, :);
            
            vehIndx = VISS_MAT_veh_Dummy(ii,4);
            if vehIndx == 0
                continue
            else
                % check if it is served
                locc = find(vehicles(lane).trajectory{vehIndx}(:,1)  >  simParameters.globalTime, 1, 'first');
                if VISS_MAT_veh_Dummy(ii, 5) == 0 && isempty(locc) % true if vehicle is unserved and no future traj point is available
                    
                    % remove served vehicles
                    VISS_MAT_veh_Dummy(ii, 5) = 1; % mark it as served
                    fwrite(TTFile,[lane vehicles(lane).initTime(vehIndx) vehicles(lane).trajectory{vehIndx}(vehicles(lane).trajPointIndx(vehIndx,2),1) vehicles(lane).idealTraj(vehIndx,7) vehicles(lane).trajectory{vehIndx}(vehicles(lane).trajPointIndx(vehIndx,1),1) vehicles(lane).type(vehIndx)]*1000,'int');
                    
                    % HERE TAKE THE CONTROL OF THIS VEHICLE BACK TO VISSIM
                    set(All_Vehicles{ii}, 'AttValue', 'ExtContr', 1);
                    set(All_Vehicles{ii}, 'AttValue', 'Speed', vehicles(lane).desiredSpeed(vehIndx) * 3600/5280); % convert fts to mph
                    
                    existingVeh(lane)   =   existingVeh(lane)   -   1       ;
                    
                    if vehIndx == vehicles(lane).vehIndx(2)
                        vehicles(lane).vehIndx(1) = 0;
                        vehicles(lane).vehIndx(2) = 0;
                        %                     break;
                    else
                        vehIndx     =   1  +   mod(vehIndx,intersectionConfig.maxNo(lane).vehsPerLane);
                        vehicles(lane).vehIndx(1) = vehIndx;
                    end
                end
                
            end
        else
            VISS_MAT_veh_Dummy(ii, :) = [LaneLink(1), -LaneLink(2), lane, 0, 0, id];
        end
    end
    VISS_MAT_veh    =       VISS_MAT_veh_Dummy    ;
    
    %%     PROCESS INCOMING VEHICLES
    ProcessIncomingMsg;
    
    if sum(  newVehArrived  )  ~=  0
        
        %         PredictFutureTraffic; % NOT APPLICABLE FOR FDOT PROJECT DUE TO
        %         LOW VOLUME (s=1800 veh/h, every lane can carry at most 450 veh/h or 1 vehicle every 8 seconds)
        
        %         [vehicles,optPhasesSeq,optPhasesTime]  =  runGA(
        %         vehicles,phasesLib,signal.nextPhasesSeq,signal.nextPhasesTime,intersectionConfig,simParameters
        %         ); % AGAIN BYPASS THIS FOR FDOT
        orderedPhaseSet = [signal.nextPhasesSeq(end), signal.nextPhasesSeq(1:end-1)];
        for phaseIndx = intersectionConfig.phaseSet
            if ~ismember(phaseIndx, orderedPhaseSet)
                orderedPhaseSet = [orderedPhaseSet, phaseIndx];
            end
        end
        
        i = 0;
        while sum(  newVehArrived  )  ~=  0
            i          = i + 1;
            phaseIndx  = orderedPhaseSet(i);
            phaseLanes = phasesLib(phaseIndx).Lanes;
            if sum(   newVehArrived(phaseLanes)   ) ~= 0 % AT LEAST ONE NEW VEHICLE HAS ARRIVED IN ANY OF CURRENT PHASE'S LANES
                for lane = phaseLanes
                    if newVehArrived( lane ) ~= 0 % LANE HAS NEW VEHICLE(S)
                        %  simParameters.globalTime >= 24 || (length(signal.nextPhasesG)>1 && signal.nextPhasesG(end)>4.6)
                        [vehicles(lane), signal]  =  TrajectoryEstOpt( vehicles(lane)...
                            ,lane,signal,intersectionConfig,phasesLib,simParameters,SCFile ); % FOR FDOT THIS FUNCTION ALSO CAN MODIFY SIGNALIZATION
                        if plot_traj && simParameters.globalTime >= t_plot_traj
                            TrajDiag(vehicles ,signal, phasesLib ,commRange ,simParameters.globalTime,simParameters.fig,intersectionConfig);
                        end
                        newVehArrived( lane ) = 0; % THE NEW VEHICLES ON CURRENT PHASE HAVE BEEN SERVED
                    end
                end
            end
        end
    end
    
    implementTrajectories
    
    %% MOVE FORWARD
    Vissim.Simulation.RunSingleStep; % move simulation one step further
    
    currFullTime = Vissim.Simulation.SimulationSecond;
    simParameters.globalTime  =  currFullTime - simParameters.refFullTime;
    %% ADJUST SIGNALIZATION
    if signal.nextPhasesG(1)    >=  timeIncrement
        signal.nextPhasesG(1)    =  signal.nextPhasesG(1) - timeIncrement;
        
    elseif signal.nextPhasesG(1) + signal.nextPhasesY(1) >= timeIncrement
        signal.nextPhasesY(1)    =  signal.nextPhasesY(1) + signal.nextPhasesG(1) - timeIncrement;
        signal.nextPhasesG(1)    =  0;
        
        % Time to make current phase yellow
        switchSignal( Vissim, 1, phasesLib(signal.nextPhasesSeq(1)).Lanes, 'AMBER' ); % possible values e.g. 'GREEN', 'RED', 'AMBER', 'REDAMBER'
        
    elseif signal.nextPhasesG(1) + signal.nextPhasesY(1) + signal.nextPhasesAR(1) >= timeIncrement
        signal.nextPhasesAR(1)   =  signal.nextPhasesAR(1) + signal.nextPhasesY(1) + signal.nextPhasesG(1) - timeIncrement;
        signal.nextPhasesG(1)    =  0;
        signal.nextPhasesY(1)    =  0;
        
        % Time to make all phases red
        switchSignal( Vissim, 1, [], 'RED' ); % possible values e.g. 'GREEN', 'RED', 'AMBER', 'REDAMBER'
        
    else
        signal.nextPhasesG(2)    =  signal.nextPhasesG(2) - (timeIncrement - signal.nextPhasesAR(1) - signal.nextPhasesY(1) - signal.nextPhasesG(1));
        signal.nextPhasesG(1)    =  [];
        signal.nextPhasesY(1)    =  [];
        signal.nextPhasesAR(1)   =  [];
        signal.nextPhasesSeq(1)  =  [];
        
        % Time to make the next phase green
        switchSignal( Vissim, 1, phasesLib(signal.nextPhasesSeq(1)).Lanes, 'GREEN' ); % possible values e.g. 'GREEN', 'RED', 'AMBER', 'REDAMBER'
    end
    
    if length(signal.nextPhasesSeq) == 1 && signal.nextPhasesG <= tLag - intersectionConfig.Y
        signal.nextPhasesG = tLag - intersectionConfig.Y;  % THIS WAY WE ARE ALWAYS READY FOR NEW VEHICLES WHILE SIGNAL DECISION NEVER GETS EMPTY
        fwrite(SCFile,[simParameters.globalTime signal.nextPhasesSeq(end) signal.nextPhasesG(end) signal.nextPhasesY(end) signal.nextPhasesAR(end)]*1000,'int');
    end
    
    
    
    
end
fclose('all');

if profile_code
    profsave
    profile viewer
end

save(['scenario',num2str(sc),'_output.mat']);
%
