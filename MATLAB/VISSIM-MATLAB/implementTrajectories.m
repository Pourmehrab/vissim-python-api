numVisVeh = size(VISS_MAT_veh, 1);

for vehIndx = 1:numVisVeh
    if VISS_MAT_veh(vehIndx, 4) ~= 0 % the vehicle thah has VI is added to the struct
        
        ii  = find(vehicles(lane).trajectory{vehIndx}(:,1)  >=  simParameters.globalTime,1);
        jj  = 1 + mod(ii,intersectionConfig.maxNo(lane).trajPoints);
        
        pos = VissimData.LinkLength(map(lane)) - interp1( [vehicles(lane).trajectory{vehIndx}(ii,1) vehicles(lane).trajectory{vehIndx}(jj,1)],...
            [vehicles(lane).trajectory{vehIndx}(ii,2) vehicles(lane).trajectory{vehIndx}(jj,2)],...
            simParameters.globalTime);
        
        moveVeh2Pos(All_Vehicles{vehIndx},0,VISS_MAT_veh(vehIndx,1),VISS_MAT_veh(vehIndx,2),pos);
                
        
    end
end
