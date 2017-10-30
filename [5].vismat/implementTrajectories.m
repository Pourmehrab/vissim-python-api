numVisVeh = size(VISS_MAT_veh, 1);

for vehIndx = 1:numVisVeh
    if VISS_MAT_veh(vehIndx, 4) ~= 0 && VISS_MAT_veh(vehIndx, 5) == 0 % the vehicle thah has VI is added to the struct, and not served
        lane = VISS_MAT_veh(vehIndx ,3);
        
        MatVehIndx = VISS_MAT_veh(vehIndx ,4);
        
        jj  = find(vehicles(lane).trajectory{MatVehIndx}(:,1)  >  simParameters.globalTime, 1, 'first');
        ii  = 1 + mod(jj-2,intersectionConfig.maxNo(lane).trajPoints);
        % ii  = find(vehicles(lane).trajectory{MatVehIndx}(:,1)  <=  simParameters.globalTime, 1, 'last');
        % jj  = 1 + mod(ii,intersectionConfig.maxNo(lane).trajPoints);
        
        pos = VissimData.LinkLength(map(lane)) - interp1( [vehicles(lane).trajectory{MatVehIndx}(ii,1) vehicles(lane).trajectory{MatVehIndx}(jj,1)],...
            [vehicles(lane).trajectory{MatVehIndx}(ii,2) vehicles(lane).trajectory{MatVehIndx}(jj,2)],...
            simParameters.globalTime);
%         fprintf('Move vehice %d in Link %d-%d to %3.3f ft\n',VISS_MAT_veh(vehIndx ,6),...
%             VISS_MAT_veh(vehIndx ,1),...
%             VISS_MAT_veh(vehIndx ,2), round(pos,3));
        
        moveVeh2Pos(All_Vehicles{vehIndx},0,VISS_MAT_veh(vehIndx,1),VISS_MAT_veh(vehIndx,2),pos);
        
    end
end
