newVehArrived  =  zeros(intersectionConfig.NoOfLanes,1);


%% ========================================================================
% Vehicle Interface
%==========================================================================

All_Vehicles    = Vissim.Net.Vehicles.GetAll; % get all vehicles in the network at the actual simulation second
VISS_MAT_veh    = zeros(length(All_Vehicles), 5); % VISS Link, VISS Lane, 
% Lane, VehIndx, Status 1: served

VissimVehCount  = Vissim.Net.Vehicles.Count;

for vehIndx = 1:VissimVehCount
    
    id = get(All_Vehicles{vehIndx},'AttValue','No');
    %     lane = str2double(get(All_Vehicles{vehIndx}.Lane,'AttValue','Link'));
    LaneLink = sscanf(get(All_Vehicles{vehIndx},'AttValue','Lane'),'%d',[1 2]);
    VISS_MAT_veh(vehIndx, :) = [LaneLink(1), -LaneLink(2), ...
        intersectionConfig.mapLink2Lane(LaneLink(1),-LaneLink(2)),...
        0, 0];
%     Vissim_link_number = LaneLink(1);
%     Vissim_lane_number = -LaneLink(2);
%     lane = intersectionConfig.mapLink2Lane(Vissim_link_number,Vissim_lane_number);
    
    % we need this to see if add this vehicle or not
    loc = find(vehicles(lane).vehID == id);
    pos = get(All_Vehicles{vehIndx},'AttValue','Pos'); % in foot
    
    if isempty(loc) && pos >= VissimData.OptRange(map(lane)) && lane <= intersectionConfig.NoOfLanes % only add non-existing vehicle that is in the detection range
        
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
        
        VISS_MAT_veh(vehIndx, 4) = VI(2);
        
        timeDiff  =  simParameters.globalTime - simParameters.refFullTime;
        
        % RECORD NEW ARRIVAL IN THIS LANE
        perfMeasure.LastArrival(1)          =   timeDiff;
        perfMeasure.LastArrival(lane+1)     =   perfMeasure.LastArrival(lane+1)+1;
        fwrite(ARFile,[lane timeDiff type]*1000,'int');
        
        % ADD ARRIVAL INFORMATION
        vehicles(lane).ID(VI(2))                 =  id;
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
