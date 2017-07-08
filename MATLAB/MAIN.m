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
tLag         = dr / intersectionConfig.safeSpeed; % rough approximation on tLag (in second)


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
while  simParameters.globalTime < End_of_veh_input || ...
        numVehs         ~=          0
    
    ProcessIncomingMsg;
    
    %     currFullTime  =  datetime('now');
    
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
    
    Vissim.Simulation.RunSingleStep;
    
    %     currFullTime = currFullTime + timeIncrement;
    currFullTime = Vissim.Simulation.SimulationSecond;
    
    simParameters.globalTime  =  currFullTime - simParameters.refFullTime;
    
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
    
    Vissim.Simulation.RunSingleStep; % move simulation one step further
    
    
    %     MONITOR AND UPDATE
    for lane  =  1:intersectionConfig.NoOfLanes
        if vehicles(lane).vehIndx(1) ~= 0
            
            NoOfVehs       = mod(vehicles(lane).vehIndx(2) - vehicles(lane).vehIndx(1) + 1, intersectionConfig.maxNoVehsPerLane);
            vehCounter     = 0;
            vehIndx        = vehicles(lane).vehIndx(1);
            while vehicles(lane).trajectory{vehIndx}(vehicles(lane).trajPointIndx(vehIndx,2),1) <= simParameters.globalTime && vehCounter < NoOfVehs
                
                %                 perfMeasure.LastThroughputByLane(1)        =   departTime;
                %                 perfMeasure.LastThroughputByLane(2)        =   vehicles(lane).initTime(vehIndx);
                %                 perfMeasure.LastThroughputByLane(lane+2)   =   perfMeasure.LastThroughputByLane(lane+2)+1;
                %                 fwrite(THFile,perfMeasure.LastThroughputByLane,'float');
                
                fwrite(TTFile,[lane vehicles(lane).initTime(vehIndx) vehicles(lane).trajectory{vehIndx}(vehicles(lane).trajPointIndx(vehIndx,2),1) vehicles(lane).idealTraj(vehIndx,7) vehicles(lane).trajectory{vehIndx}(vehicles(lane).trajPointIndx(vehIndx,1),1) vehicles(lane).type(vehIndx)]*1000,'int');
                
                vehCounter  =   vehCounter  +   1;
                
                existingVeh(lane)  = existingVeh(lane) - 1;
                
                if vehIndx == vehicles(lane).vehIndx(2)
                    vehicles(lane).vehIndx(1) = 0;
                    vehicles(lane).vehIndx(2) = 0;
                    break;
                else
                    vehIndx     =   1  +   mod(vehIndx,intersectionConfig.maxNoVehsPerLane);
                    vehicles(lane).vehIndx(1) = vehIndx;
                end
            end
        end
    end
end
fclose('all');

if profile_code
    profsave
    profile viewer
end

save(['scenario',num2str(sc),'_output.mat']);
%


