newVehArrived  =  zeros(intersectionConfig.NoOfLanes,1);


%% ========================================================================
% Vehicle Interface
%==========================================================================

% All_Vehicles    = Vissim.Net.Vehicles.GetAll; % get all vehicles in the network at the actual simulation second
% VISS_MAT_veh    = zeros(length(All_Vehicles), 5); % VISS Link, VISS Lane,
% Lane, VehIndx, Status 1: served

% VISS_MAT_veh
% 1 vissim link
% 2 vissim lane
% 3 matlab lane
% 4 vehicle index in matlab array
% 5 1:served; 0 unserved; -1 not in incomming lane
% 6 id

for vehIndx = 1:VissimVehCount
    if  VISS_MAT_veh(vehIndx, 4) == 0 && VISS_MAT_veh(vehIndx, 5) == 0
        
        lane = VISS_MAT_veh(vehIndx, 3);
        id = VISS_MAT_veh(vehIndx, 6);
        
        pos = get(All_Vehicles{vehIndx},'AttValue','Pos'); % in foot
        
        if pos >= VissimData.OptRange(map(lane)) % only add vehicle that is in the detection range
            
            % HERE TAKE THE CONTROL OF THIS VEHICLE FORM TO VISSIM (FIND THE RIGHT ID)
            set(All_Vehicles{vehIndx}, 'AttValue', 'ExtContr', 4);
            
            type = floor(str2num(get(All_Vehicles{vehIndx},'AttValue','VehType'))/610); % returns 1 if AV and 0 if Conventional
            speed = get(All_Vehicles{vehIndx},'AttValue','Speed');
            
            newVehArrived(lane)   =   newVehArrived(lane)  +  1;
            
            if vehicles(lane).vehIndx(1) == 0 % IF THIS IS THE FIRST VEHICLE BEING ADDED TO THE LANE
                vehicles(lane).vehIndx(1) = 1;
                vehicles(lane).vehIndx(2) = 1;
            else
                vehicles(lane).vehIndx(2) = 1 + mod(vehicles(lane).vehIndx(2),intersectionConfig.maxNo(lane).vehsPerLane);
            end
            
            VI = vehicles(lane).vehIndx;
            
            VISS_MAT_veh(vehIndx, 4) = VI(2); % This is thedifference between a vehicle inside the detection range and others
            
            timeDiff  =  simParameters.globalTime - simParameters.refFullTime;
            
            % RECORD NEW ARRIVAL IN THIS LANE
            perfMeasure.LastArrival(1)          =   timeDiff;
            perfMeasure.LastArrival(lane+1)     =   perfMeasure.LastArrival(lane+1)+1;
            fwrite(ARFile,[lane timeDiff type]*1000,'int');
            
            % ADD ARRIVAL INFORMATION
            vehicles(lane).vehID(VI(2))              =  id;
            vehicles(lane).initTime(VI(2))           =  timeDiff;
            vehicles(lane).currSpeed(VI(2))          =  speed;
            vehicles(lane).trajectory{(VI(2))}(1,:)  =  [simParameters.globalTime VissimData.LinkLength(map(lane)) - pos ];
            vehicles(lane).trajPointIndx(VI(2),:)    =  [1,1];
            vehicles(lane).length(VI(2))             =  get(All_Vehicles{vehIndx},'AttValue','Length');
            vehicles(lane).maxAccRate(VI(2))         =  11.5;  % ft/s2
            vehicles(lane).maxDeccRate(VI(2))        = -13.5;  % ft/s2
            
            vehicles(lane).type(VI(2))               = type;
            vehicles(lane).destination(VI(2))     =  1; %  RIGHT:0 ThROUGH:1 LEFT:2
            %         vehicles(lane).desiredSpeed(VI(2))    =  get(All_Vehicles{vehIndx},'AttValue','DesSpeed');
            vehicles(lane).desiredSpeed(VI(2))    =  intersectionConfig.safeSpeed(lane);
            vehicles(lane).trajReceived(VI(2))    =  0;
            vehicles(lane).served(VI(2))          =  0;
            
            fprintf('* Lane %d (%d-%d): ID %d; t %3.1f; v %3.1f; d %5.1f; pos %5.1f; type %d\n',lane,VISS_MAT_veh(vehIndx, 1),VISS_MAT_veh(vehIndx, 2), id, timeDiff,  speed,vehicles(lane).trajectory{(VI(2))}(1,2),pos,type)
            
            % TO KNOW WHATS THE FREE FLOW TIME AS A BASELINE FOR DELAY
            % COMPUTATION (ISSUE: SIGNALIZATION IS CONSIDERED NOT FRONT VEHICLE)
            [vehicles(lane).idealTraj(VI(2),1),...      % t1
                vehicles(lane).idealTraj(VI(2),2),...   % t2
                vehicles(lane).idealTraj(VI(2),3),...   % t3
                vehicles(lane).idealTraj(VI(2),4),...   % V2
                vehicles(lane).idealTraj(VI(2),5),...   % a1
                vehicles(lane).idealTraj(VI(2),6),...   % a3
                vehicles(lane).idealTraj(VI(2),7),...   % T
                ~] = NonlinLTOsolver( ...
                vehicles(lane).trajectory{VI(2)}(vehicles(lane).trajPointIndx(VI(2),2),2),...
                vehicles(lane).currSpeed(VI(2)), ...
                intersectionConfig.crossingSpeed(vehicles(lane).destination(VI(2))) ,...
                intersectionConfig.safeSpeed(lane) ,...
                vehicles(lane).maxDeccRate(VI(2)) ,...
                vehicles(lane).maxAccRate(VI(2)) ,...
                [0, 1000] ,simParameters);
            
            
        end
    end
end
