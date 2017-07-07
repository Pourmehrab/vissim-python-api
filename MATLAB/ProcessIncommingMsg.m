newVehArrived  =  zeros(intersectionConfig.NoOfLanes,1);


%% ========================================================================
% Vehicle Interface
%==========================================================================

All_Vehicles    = Vissim.Net.Vehicles.GetAll; % get all vehicles in the network at the actual simulation second


VissimVehCount = Vissim.Net.Vehicles.Count;


for vehIndx = 1:VissimVehCount
    
    id = get(All_Vehicles{vehIndx},'AttValue','No');
    lane = str2double(get(All_Vehicles{vehIndx}.Lane,'AttValue','Link'));
    pos = get(All_Vehicles{vehIndx},'AttValue','Pos'); % in foot
    
    loc = find(vehicles(lane).vehID == id);
    
    if nonempty(loc) && pos >= VissimData.OptRange(lane) % only add non-existing vehicles that are in the detection range
        
        
        type = get(All_Vehicles{vehIndx},'AttValue','VehType');
        speed = get(All_Vehicles{vehIndx},'AttValue','Speed');
        
        newVehArrived(lane)   =   newVehArrived(lane)  +  1;
        
        if vehicles(lane).vehIndx(1) == 0 % IF THIS IS THE FIRST VEHICLE BEING ADDED TO THE LANE
            vehicles(lane).vehIndx(1) = 1;
            vehicles(lane).vehIndx(2) = 1;
        else
            vehicles(lane).vehIndx(2) = 1 + mod(vehicles(lane).vehIndx(2),intersectionConfig.maxNoVehsPerLane);
        end
        
        VI = vehicles(lane).vehIndx;
        
        timeDiff  =  (FullListOfVeh(lane).initTime(vehIndx,1)-simParameters.refFullTime(1))*3600 + (FullListOfVeh(lane).initTime(vehIndx,2)-simParameters.refFullTime(2))*60 + (FullListOfVeh(lane).initTime(vehIndx,3)-simParameters.refFullTime(3));
        
        % RECORD NEW ARRIVAL IN THIS LANE
        perfMeasure.LastArrival(1)          =   timeDiff;
        perfMeasure.LastArrival(lane+1)     =   perfMeasure.LastArrival(lane+1)+1;
        fwrite(ARFile,[lane timeDiff FullListOfVeh(lane).type(vehIndx)]*1000,'int');
        
        % ADD ARRIVAL INFORMATION
        vehicles(lane).ID(VI(2))                 =  FullListOfVeh(lane).ID(vehIndx);
        vehicles(lane).initTime(VI(2))           =  timeDiff;
        vehicles(lane).currSpeed(VI(2))          =  FullListOfVeh(lane).currSpeed(vehIndx);
        vehicles(lane).trajectory{(VI(2))}(1,:)  =  [simParameters.globalTime ...
            FullListOfVeh(lane).distance(vehIndx)-(simParameters.globalTime - timeDiff) * vehicles(lane).currSpeed(VI(2)) ];
        vehicles(lane).trajPointIndx(VI(2),:)    =  [1,1];
        vehicles(lane).length(VI(2))             =  FullListOfVeh(lane).length(vehIndx);
        vehicles(lane).maxAccRate(VI(2))         =  FullListOfVeh(lane).maxAccRate(vehIndx);
        vehicles(lane).maxDeccRate(VI(2))        =  FullListOfVeh(lane).maxDeccRate(vehIndx);
        
        vehicles(lane).type(VI(2))            =  FullListOfVeh(lane).type(vehIndx);
        vehicles(lane).destination(VI(2))     =  FullListOfVeh(lane).destination(vehIndx); %  RIGHT:0 ThROUGH:1 LEFT:2
        vehicles(lane).desiredSpeed(VI(2))    =  FullListOfVeh(lane).desiredSpeed(vehIndx);
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
            intersectionConfig.safeSpeed ,...
            vehicles(lane).maxDeccRate(VI(2)) ,...
            vehicles(lane).maxAccRate(VI(2)) ,...
            [0, 1000] ,simParameters);
        
        
    end
    
end