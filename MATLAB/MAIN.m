% BY:    MAHMOUD POURMEHRAB
% EMAIL: POURMEHRAB@GMAIL.COM

clc;
clear;
close('all');
fclose('all');
delete('*.bin');
delete('*.png');

%% LOAD DATA FILE
sc                          =           581;

filename         =       ['scenario',num2str(sc),'_input.mat'];
load (filename,'vehicles','phasesLib','simParameters','intersectionConfig','FullListOfVeh','simEndTime','commRange');

% TRAVEL TIME VALUES STORED
TTFile  =           fopen(['scenario',num2str(sc),'_TT.bin'],'w');
% ARRIVAL VALUES STORED
ARFile  =           fopen(['scenario',num2str(sc),'_AR.bin'],'w');
% SIGNAL VALUES STORED
SCFile  =           fopen(['scenario',num2str(sc),'_SC.bin'],'w');


%% IMPORT/DEFINE VARIABLES REQUIRED TO RUN THE SIMULATION

% simParameters.refFullTime           =   datetime('now');

perfMeasure  =  struct('LastThroughputByLane',zeros(1,intersectionConfig.NoOfLanes+1+1),...
    'LastArrival',zeros(1,intersectionConfig.NoOfLanes + 1));

% ESTIMATE THE LAG TIME FOR THE AN SLOW VEHICLE
oldVehIndx   = zeros(intersectionConfig.NoOfLanes,1); % THIS KEEPS WHERE LAST OLD VEHICLEIS IS PLACED IN MASTER VEHICLES STRUCTURE
remainingVeh = ones(intersectionConfig.NoOfLanes,1); % THIS WILL KEPP HOW MANY OF GENERATED VEHICLES ARE NOT ADDED YET IN EACH LANE
existingVeh  = zeros(intersectionConfig.NoOfLanes,1);
tLag         = 0;
for lane  =  1:intersectionConfig.NoOfLanes
    remainingVeh(lane) = FullListOfVeh(lane).lastVehIndx - perfMeasure.LastArrival(lane+1);
    
    [ ~,~,~,~,~,~,tLagP,~ ] = NonlinLTOsolver( commRange , intersectionConfig.minSpeed , ...
        intersectionConfig.crossingSpeed(1) , intersectionConfig.safeSpeed , FullListOfVeh(lane).maxDeccRate(1) , FullListOfVeh(lane).maxAccRate(1) , [0, 1000] , simParameters);
    
    if tLag  <  tLagP
        tLag = tLagP;
    end
end

%

%% SIGNAL VARIABLES INITIALIZATION
signal.nextPhasesSeq      = [1]; % PHASES CAME FROM THEORY
signal.nextPhasesG        = [tLag - intersectionConfig.Y];
signal.nextPhasesY        = [intersectionConfig.Y];
signal.nextPhasesAR       = [intersectionConfig.AR];
%DO NOT RECORD THIS SIGNAL DECISION SINCE NO VEHICLE CAN USE IT
currFullTime              = simParameters.refFullTime;

% currFullTime  =  datetime('now');

%% MAIN CONTROL LOOP
timeIncrement = 0.1;
simParameters.fig   =   figure('Name','Trajectories per Lanes','NumberTitle','off','units','normalized','outerposition',[0 0 1 1],'Color','w');

% profile on
while  true
    
    ProcessIncommingMsg;
    
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
                        if simParameters.globalTime >= 0
                            TrajDiag(vehicles ,signal, phasesLib ,commRange ,simParameters.globalTime,simParameters.fig,intersectionConfig);
                            remainingVeh
                        end
                        newVehArrived( lane ) = 0; % THE NEW VEHICLES ON CURRENT PHASE HAVE BEEN SERVED
                    end
                end
            end
        end
    end
    
    % PREDICTED VEHICLES ARE NOT NEEDED ANYMORE (NO PREDICTED VEHICLE FOR FDOT)
    %         for lane  =  1:intersectionConfig.NoOfLanes
    %             if vehicles(lane).predicted(vehicles(lane).vehIndx(1)) == 1
    %                 vehicles(lane).vehIndx(1) = 0;
    %                 vehicles(lane).vehIndx(2) = 0;
    %             else
    %                 while vehicles(lane).predicted(vehicles(lane).vehIndx(2)) == 1
    %                     vehicles(lane).vehIndx(2) = 1 + mod(vehicles(lane).vehIndx(2)-2,intersectionConfig.maxNoVehsPerLane);
    %                 end
    %             end
    %         end
    
    
    
    t = currFullTime(3) + timeIncrement;
    currFullTime(3) = t;
    if t >= 60 % SINCE THE INCREMENT IS SMALL, NO NEED TO USE MOD: NEVER HAVE 2 MIN OR 2 HR JUMP
        currFullTime(3) = t - 60;
        currFullTime(2) = currFullTime(2) + 1;
        
        if currFullTime(2) >= 60
            currFullTime(2) = currFullTime(2) - 60;
            currFullTime(1) = currFullTime(1) + 1;
        end
    end
    
    simParameters.globalTime  =  (currFullTime(1)-simParameters.refFullTime(1))*3600+...
        (currFullTime(2)-simParameters.refFullTime(2))*60+...
        (currFullTime(3)-simParameters.refFullTime(3));
    
    if signal.nextPhasesG(1)    >=  timeIncrement
        signal.nextPhasesG(1)    =  signal.nextPhasesG(1) - timeIncrement;
        
    elseif signal.nextPhasesG(1) + signal.nextPhasesY(1) >= timeIncrement
        signal.nextPhasesY(1)    =  signal.nextPhasesY(1) + signal.nextPhasesG(1) - timeIncrement;
        signal.nextPhasesG(1)    =  0;
        
    elseif signal.nextPhasesG(1) + signal.nextPhasesY(1) + signal.nextPhasesAR(1) >= timeIncrement
        signal.nextPhasesAR(1)   =  signal.nextPhasesAR(1) + signal.nextPhasesY(1) + signal.nextPhasesG(1) - timeIncrement;
        signal.nextPhasesG(1)    =  0;
        signal.nextPhasesY(1)    =  0;
        
    else
        signal.nextPhasesG(2)    =  signal.nextPhasesG(2) - (timeIncrement - signal.nextPhasesAR(1) - signal.nextPhasesY(1) - signal.nextPhasesG(1));
        signal.nextPhasesG(1)    =  [];
        signal.nextPhasesY(1)    =  [];
        signal.nextPhasesAR(1)   =  [];
        signal.nextPhasesSeq(1)  =  [];
    end
    
    if length(signal.nextPhasesSeq) == 1 && signal.nextPhasesG <= tLag - intersectionConfig.Y
        signal.nextPhasesG = tLag - intersectionConfig.Y;  % THIS WAY WE ARE ALWAYS READY FOR NEW VEHICLES WHILE SIGNAL DECISION NEVER GETS EMPTY
        fwrite(SCFile,[simParameters.globalTime signal.nextPhasesSeq(end) signal.nextPhasesG(end) signal.nextPhasesY(end) signal.nextPhasesAR(end)]*1000,'int');
    end
    

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
    
    if sum(existingVeh) == 0 && sum(remainingVeh) == 0 % TERMINATION CONDITION : SYSTEM IS EMPTY
        break;
    end

         pause(timeIncrement)
end
fclose('all');
% profsave
%
save(['scenario',num2str(sc),'_output.mat']);
%
% profile viewer


