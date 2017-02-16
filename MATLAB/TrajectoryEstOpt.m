function [ vehicle, signal ] = TrajectoryEstOpt( vehicle,lane,signal,intersectionConfig,phasesLib,simParameters,SCFile )

% occupiedDist = 0; % THIS INCLUDES THE VEHICLE LENGTH AND THE SAFE HEADWAY BEHIND IT
cardNextPhases      = length(signal.nextPhasesSeq);

j = vehicle.vehIndx(1); % FOR NOW IT KEEPS INDX OF FIRST VEHICLE IN THIS LANE
if vehicle.served(j) == 0 % WE DO SAME COMPUTATION FOR CONVENTIONAL/AUTOMATED LEAD VEHICLE
    
    TPI = vehicle.trajPointIndx(j,:); % IT KEEPS THE TRAJECTORY POINT INDEX FOR FIRST & LAST TRAJECTORY POINTS
    
    phaseIndx = 1; updatedTime = simParameters.globalTime;
    while vehicle.served(j) == 0 && phaseIndx <= cardNextPhases % SEARCH FOR AN OPEN WINDOW IN NEXT GREENS IN TIMELY ORDER
        updatedTime = updatedTime + signal.nextPhasesG(phaseIndx) + signal.nextPhasesY(phaseIndx);
        endOfGreen  = updatedTime - vehicle.trajectory{j}(TPI(2),1);
        updatedTime = updatedTime + signal.nextPhasesAR(phaseIndx);
        if ismember( lane, phasesLib(signal.nextPhasesSeq( phaseIndx )).Lanes) && endOfGreen >= vehicle.idealTraj(j,7)
            startGreen = endOfGreen - (signal.nextPhasesG(phaseIndx) + signal.nextPhasesY(phaseIndx));
            if  startGreen <= vehicle.idealTraj(j,7)
                t1 = vehicle.idealTraj(j,1);
                t2 = vehicle.idealTraj(j,2);
                t3 = vehicle.idealTraj(j,3);
                V2 = vehicle.idealTraj(j,4);
                a1 = vehicle.idealTraj(j,5);
                a3 = vehicle.idealTraj(j,6);
                TT = vehicle.idealTraj(j,7);
                
                vehicle.served(j)      = 1;
            else
                [t1, t2, t3, V2, a1, a3, TT, vehicle.served(j)] = NonlinLTOsolver( vehicle.trajectory{j}(TPI(2),2),...
                    vehicle.currSpeed(j), ...
                    intersectionConfig.crossingSpeed(vehicle.destination(j)),...
                    intersectionConfig.safeSpeed ,...
                    vehicle.maxDeccRate(j),...
                    vehicle.maxAccRate(j),...
                    [startGreen, startGreen + 1000], simParameters );
                
%                 vehicle.served(j)      = 1; NOT NEEDED
            end
        end
        phaseIndx   = phaseIndx + 1;
    end
    
    if vehicle.served(j) == 0 % AN OPEN WINDOW COULD NOT BE FOUND, DO SOMTHING ABOUT SIGNALIZATION TO MAKE ROOM FOR THIS VEHICLE
        
        if ismember( lane, phasesLib(signal.nextPhasesSeq( end )).Lanes) % EXTEND THE LAST PHASE
            t1 = vehicle.idealTraj(j,1);
            t2 = vehicle.idealTraj(j,2);
            t3 = vehicle.idealTraj(j,3);
            V2 = vehicle.idealTraj(j,4);
            a1 = vehicle.idealTraj(j,5);
            a3 = vehicle.idealTraj(j,6);
            TT = vehicle.idealTraj(j,7);
            
            vehicle.served(j)      = 1;
            signal.nextPhasesG(end) = signal.nextPhasesG(end)+vehicle.trajectory{j}(vehicle.trajPointIndx(j,2),1)+TT-updatedTime+signal.nextPhasesAR(end);
            fwrite(SCFile,[simParameters.globalTime signal.nextPhasesSeq(end) signal.nextPhasesG(end) signal.nextPhasesY(end) signal.nextPhasesAR(end)]*1000,'int');
            
        else % JUST ADD A PHASE TO PHASE SEQ
            [t1, t2, t3, V2, a1, a3, TT, vehicle.served(j)] = NonlinLTOsolver( vehicle.trajectory{j}(TPI(2),2),...
                vehicle.currSpeed(j), ...
                intersectionConfig.crossingSpeed(vehicle.destination(j)),...
                intersectionConfig.safeSpeed ,...
                vehicle.maxDeccRate(j),...
                vehicle.maxAccRate(j),...
                updatedTime - vehicle.trajectory{j}(TPI(2),1) + [0, 1000], simParameters );
            
            for phaseIndx =  intersectionConfig.phaseSet % FIND THE PHASE THAT SERVES THIS LANE
                if ismember( lane, phasesLib(phaseIndx).Lanes)
                    signal.nextPhasesSeq = [signal.nextPhasesSeq, phaseIndx];
                    break;
                end
            end
            
            signal.nextPhasesG  = [signal.nextPhasesG, max(vehicle.trajectory{j}(TPI(2),1)+TT-updatedTime,phasesLib(signal.nextPhasesSeq(end)).MinG)];
            signal.nextPhasesY  = [signal.nextPhasesY, intersectionConfig.Y];
            signal.nextPhasesAR = [signal.nextPhasesAR, intersectionConfig.AR];
            fwrite(SCFile,[simParameters.globalTime+sum(signal.nextPhasesG(1:end-1))+sum(signal.nextPhasesY(1:end-1))+sum(signal.nextPhasesAR(1:end-1)) signal.nextPhasesSeq(end) signal.nextPhasesG(end) signal.nextPhasesY(end) signal.nextPhasesAR(end)]*1000,'int');
            
            cardNextPhases = cardNextPhases + 1;
%             vehicle.served(j)    = 1; NOT NEEDED
        end
    end
    % AN OPEN WINDOW WAS FOUND DURING THE SEARCH, BUILD THE TRAJJECTORY
    t = 0;
    while t <= t1 - simParameters.trajTimePrecision  % MAKE THE FIRST STAGE OF TRAJECTORY
        t = t + simParameters.trajTimePrecision;
        m = 1 + mod(vehicle.trajPointIndx(j,2),intersectionConfig.maxNoTrajPoint);
        vehicle.trajPointIndx(j,2) = m;
        
        vehicle.trajectory{j}(m,1) = t+vehicle.trajectory{j}(TPI(2),1);
        vehicle.trajectory{j}(m,2) = round(vehicle.trajectory{j}(TPI(2),2)-...
            (a1*t^2/2 + vehicle.currSpeed(j) * t),simParameters.distanceDecimals);
    end
    
    t = t - t1;
    dm = vehicle.trajectory{j}(TPI(2),2)-(a1*t1^2/2 + vehicle.currSpeed(j) * t1);
    while t <= t2 - simParameters.trajTimePrecision  % MAKE THE SECOND STAGE OF TRAJECTORY
        t = t + simParameters.trajTimePrecision;
        m = 1 + mod(vehicle.trajPointIndx(j,2),intersectionConfig.maxNoTrajPoint);
        vehicle.trajPointIndx(j,2) = m;
        
        vehicle.trajectory{j}(m,1) = t + vehicle.trajectory{j}(TPI(2),1) + t1;
        vehicle.trajectory{j}(m,2) = round(dm-V2*t,simParameters.distanceDecimals);
    end
    
    Tm = t1 + t2; t = t-t2; dm = dm-V2*t2;
    while t <= t3 - simParameters.trajTimePrecision  % MAKE THE THIRD STAGE OF TRAJECTORY
        t = t + simParameters.trajTimePrecision;
        m = 1 + mod(vehicle.trajPointIndx(j,2),intersectionConfig.maxNoTrajPoint);
        vehicle.trajPointIndx(j,2) = m;
        
        vehicle.trajectory{j}(m,1) = t+vehicle.trajectory{j}(TPI(2),1)+Tm;
        vehicle.trajectory{j}(m,2) = round(dm-(a3*t^2/2 + V2 * t),simParameters.distanceDecimals);
    end
    
    if t + Tm < TT   % ADD THE LAST POINT IF IT'S NOT ADDED
        m = 1 + mod(vehicle.trajPointIndx(j,2),intersectionConfig.maxNoTrajPoint);
        vehicle.trajPointIndx(j,2) = m;
        
        vehicle.trajectory{j}(m,1) = vehicle.trajectory{j}(TPI(2),1) + TT;
        vehicle.trajectory{j}(m,2) = round(dm-(a3*t3^2/2 + V2 * t3),simParameters.distanceDecimals);
    end
    vehicle.currSpeed(j) = intersectionConfig.crossingSpeed(vehicle.destination(j));
end

%% FROM HERE DO THE COMPUTATION FOR THE FOLLOWER VEHICLES
NoOfVehs       = mod(vehicle.vehIndx(2) - vehicle.vehIndx(1) + 1, intersectionConfig.maxNoVehsPerLane);
k              = j; % k : FOLLOWER VEHICLE INDEX, j : LEAD VEHICLE INDEX
intersectionConfig.minTimeHeadway = 2; % SATURATION HEADWAY IN SECOND

for vehCounter = 2: NoOfVehs % NO REAL VEHICLE APPEARS AFTER NONREAL ONE, SO IF A NONREAL LEAD VEHICLE IS NOT SERVED THE REST CANNOT BE SERVED
    k              = 1 + mod(k,intersectionConfig.maxNoVehsPerLane); % GO TO THE NEXT VEHICLE
    if vehicle.served(k) == 0
        if vehicle.type(k) == 1 % AN AUTOMATED VEHICLE
            
            updatedTime = simParameters.globalTime;
            tStar = vehicle.trajectory{j}(vehicle.trajPointIndx(j,2),1) + intersectionConfig.minTimeHeadway;
            for phaseIndx = 1 : cardNextPhases
                updatedTime = updatedTime + signal.nextPhasesG(phaseIndx) + signal.nextPhasesY(phaseIndx);
                if ismember( lane, phasesLib(signal.nextPhasesSeq( phaseIndx )).Lanes) && tStar <= updatedTime % HYPOTHETICALLY SAYING, THERE IS ROOM FOR ANOTHER VEHICLE
                    %         FORM THE HYPOTHETICAL TRAJECTORY BASED ON LEAD VEHICLE
                    hypTrajectory  = vehicle.trajectory{j};
                    TPI            = vehicle.trajPointIndx(j,:);
                    
                    NoOfTrajPoints = mod( TPI(2) - TPI(1) + 1, intersectionConfig.maxNoTrajPoint);
                    trajCounter    = 1; m = TPI(1);
                    while trajCounter <= NoOfTrajPoints % BUILD THE HYPOTHETICAL TRAJECTORY BY APPLYING TIME GAP
                        hypTrajectory(m,1) = hypTrajectory(m,1) + intersectionConfig.minTimeHeadway;
                        m = 1 + mod(m,intersectionConfig.maxNoTrajPoint);
                        trajCounter  =  trajCounter  +  1;
                    end
                    
                    trajCounter    = 1; m   =   TPI(1);%vehicle.currSpeed(vehicle.vehIndx(k))=57;
                    refI            = vehicle.trajPointIndx(k,2);
                    transitionFlag =  0; % ONCE A TRANSITION IS FOUND THIS WILL BE EQUAL TO 1
                    while trajCounter <= NoOfTrajPoints % SEARCH FOR A POSSIBLR SPEED ADJUSTMENT TO CATCH UP THE HYPOTHETICAL TRAJECTORY
                        if hypTrajectory(m,1) > vehicle.trajectory{k}(refI,1)
                            if trajCounter > 1
                                Vf = (hypTrajectory(prevIndx,2)-hypTrajectory(m,2))/(hypTrajectory(m,1)-hypTrajectory(prevIndx,1));
                            else
                                Vf = vehicle.currSpeed(k);
                            end
                            a  = 6*(2 * (vehicle.trajectory{k}(refI,2)-hypTrajectory(m,2)) + (vehicle.trajectory{k}(refI,1) - hypTrajectory(m,1)) * (vehicle.currSpeed(k) + Vf))/(vehicle.trajectory{k}(refI,1) - hypTrajectory(m,1))^3;
                            b  = (6 * (vehicle.trajectory{k}(refI,2)-hypTrajectory(m,2)) + 2*(vehicle.trajectory{k}(refI,1) - hypTrajectory(m,1)) * (2 * vehicle.currSpeed(k) + Vf))/(vehicle.trajectory{k}(refI,1) - hypTrajectory(m,1))^2;
                            if b <= vehicle.maxAccRate(k) && b >= vehicle.maxDeccRate(k) &&...
                                    b + a * (hypTrajectory(m,1) - vehicle.trajectory{k}(refI,1)) <= vehicle.maxAccRate(k) && b + a * (hypTrajectory(m,1) - vehicle.trajectory{k}(refI,1)) >= vehicle.maxDeccRate(k)
                                transitionFlag = 1; % A VALID TRANSITION IS FOUND SO BUILD IT AND TERMINATE THE SEARCH
                            end
                            if transitionFlag
                                vehicle.served(k) = 1; % SERVED
                                TT = tStar - vehicle.trajectory{k}(vehicle.trajPointIndx(k,1),1);
                                if TT < vehicle.idealTraj(k,7)
                                    vehicle.idealTraj(k,:) = [0,0,0,0,0,0,TT];
                                end
                                t = vehicle.trajectory{k}(refI,1);
                                while t + simParameters.trajTimePrecision < hypTrajectory(m,1) - 10e-4  % MAKE THE TRANSITION STAGE OF TRAJECTORY
                                    t = t + simParameters.trajTimePrecision;
                                    vehicle.trajPointIndx(k,2) = 1 + mod(vehicle.trajPointIndx(k,2),intersectionConfig.maxNoTrajPoint);
                                    
                                    vehicle.trajectory{k}(vehicle.trajPointIndx(k,2),1) = t;
                                    dt = t - vehicle.trajectory{k}(refI,1);
                                    vehicle.trajectory{k}(vehicle.trajPointIndx(k,2),2) = round(vehicle.trajectory{k}(refI,2)-...
                                        (a*dt^3/6 + b*dt^2/2 + vehicle.currSpeed(k)*dt),simParameters.distanceDecimals);
                                end
                                
                                while trajCounter <= NoOfTrajPoints % ADD THE REST OF HYPOTHETICAL TRAJECTORY
                                    vehicle.trajPointIndx(k,2) = 1 + mod(vehicle.trajPointIndx(k,2),intersectionConfig.maxNoTrajPoint);
                                    vehicle.trajectory{k}(vehicle.trajPointIndx(k,2),1) = hypTrajectory(m,1);
                                    vehicle.trajectory{k}(vehicle.trajPointIndx(k,2),2) = hypTrajectory(m,2);
                                    m = 1 + mod(m,intersectionConfig.maxNoTrajPoint);
                                    trajCounter  =  trajCounter  +  1;
                                end
                                vehicle.currSpeed(k) = vehicle.currSpeed(j);
                                
                                break; % HALT THE WHILE SEARCH ON TRAJ POINTS
                            else
                                prevIndx  =  m;
                                m   =   1 + mod(m,intersectionConfig.maxNoTrajPoint);
                                trajCounter  =  trajCounter  +  1;
                            end
                        else
                            prevIndx  =  m;
                            m   =   1 + mod(m,intersectionConfig.maxNoTrajPoint);
                            trajCounter  =  trajCounter  +  1;
                        end
                    end
                    
                    if ~transitionFlag % CHECK FREE MOVEMENT IN THE REMAINING TIME IN THIS PHASE
                        [t1,t2,t3,V2,a1,a3,TT,vehicle.served(k)] = NonlinLTOsolver( vehicle.trajectory{k}(vehicle.trajPointIndx(k,2),2),...
                            vehicle.currSpeed(k),...
                            intersectionConfig.crossingSpeed(vehicle.destination(k)),...
                            intersectionConfig.safeSpeed,...
                            vehicle.maxDeccRate(k),...
                            vehicle.maxAccRate(k),...
                            [tStar , updatedTime]- vehicle.trajectory{k}(vehicle.trajPointIndx(k,2),1), simParameters );
                        
                        if vehicle.served(k) == 1 % VEHICLE CAN BE SERVED, BUILD THE TRAJECTORY
                            TPI              = vehicle.trajPointIndx(k,:);
                            t = 0;
                            while t <= t1 - simParameters.trajTimePrecision  % MAKE THE FIRST STAGE OF TRAJECTORY
                                t = t + simParameters.trajTimePrecision;
                                vehicle.trajPointIndx(k,2) = 1 + mod(vehicle.trajPointIndx(k,2),intersectionConfig.maxNoTrajPoint);
                                
                                vehicle.trajectory{k}(vehicle.trajPointIndx(k,2),1) = t+vehicle.trajectory{k}(TPI(2),1);
                                vehicle.trajectory{k}(vehicle.trajPointIndx(k,2),2) = round(vehicle.trajectory{k}(TPI(2),2)-...
                                    (a1*t^2/2 + vehicle.currSpeed(k) * t),simParameters.distanceDecimals);
                            end
                            
                            t = t - t1;
                            dm = vehicle.trajectory{k}(TPI(2),2) - (a1*t1^2/2 + vehicle.currSpeed(k) * t1);
                            while t <= t2 - simParameters.trajTimePrecision  % MAKE THE SECOND STAGE OF TRAJECTORY
                                t = t + simParameters.trajTimePrecision;
                                vehicle.trajPointIndx(k,2) = 1 + mod(vehicle.trajPointIndx(k,2),intersectionConfig.maxNoTrajPoint);
                                
                                vehicle.trajectory{k}(vehicle.trajPointIndx(k,2),1) = t+vehicle.trajectory{k}(TPI(2),1)+t1;
                                vehicle.trajectory{k}(vehicle.trajPointIndx(k,2),2) = round(dm-V2*t,simParameters.distanceDecimals);
                            end
                            
                            Tm = t1 + t2; t = t-t2;
                            dm = dm - V2 * t2;
                            while t <= t3 - simParameters.trajTimePrecision  % MAKE THE THIRD STAGE OF TRAJECTORY
                                t = t + simParameters.trajTimePrecision;
                                vehicle.trajPointIndx(k,2) = 1 + mod(vehicle.trajPointIndx(k,2),intersectionConfig.maxNoTrajPoint);
                                
                                vehicle.trajectory{k}(vehicle.trajPointIndx(k,2),1) = t+vehicle.trajectory{k}(TPI(2),1) + Tm;
                                vehicle.trajectory{k}(vehicle.trajPointIndx(k,2),2) = round(dm - (a3*t^2/2 + V2 * t),simParameters.distanceDecimals);
                            end
                            
                            if t + Tm < TT   % ADD THE LAST POINT IF IT'S NOT ADDED
                                vehicle.trajPointIndx(k,2) = 1 + mod(vehicle.trajPointIndx(k,2),intersectionConfig.maxNoTrajPoint);
                                
                                vehicle.trajectory{k}(vehicle.trajPointIndx(k,2),1) = vehicle.trajectory{k}(TPI(2),1) + TT;
                                vehicle.trajectory{k}(vehicle.trajPointIndx(k,2),2) = round(dm - (a3*t3^2/2 + V2 * t3),simParameters.distanceDecimals);
                            end
                        end
                    end
                    break; % HALT THE FOR SEARCH ON PHASES
                else
                    if vehicle.trajectory{j}(vehicle.trajPointIndx(j,2),1) <= updatedTime
                        break;
                    else
                        updatedTime = updatedTime + signal.nextPhasesAR(phaseIndx);
                    end
                end
            end
            
            if vehicle.served(k) == 0  % THERE IS NO ROOM FOR ANOTHER VEHICLE WITHIN CURRENT GREEN, FIRST SEARCH FOR OTHER AVAILABLE PHASE, IF THERE IS NO SUCH PHASE ADD ONE
                updatedTime = simParameters.globalTime+sum(signal.nextPhasesG(1:phaseIndx))+sum(signal.nextPhasesY(1:phaseIndx))+sum(signal.nextPhasesAR(1:phaseIndx));
                phaseIndx   = phaseIndx + 1;
                while vehicle.served(k) == 0 && phaseIndx <= cardNextPhases - 1
                    updatedTime = updatedTime + signal.nextPhasesG(phaseIndx) + signal.nextPhasesY(phaseIndx);
                    endOfGreen  = updatedTime - vehicle.trajectory{k}(vehicle.trajPointIndx(k,2),1);
                    if ismember( lane, phasesLib(signal.nextPhasesSeq( phaseIndx )).Lanes) && endOfGreen >= vehicle.idealTraj(k,7)
                        [t1,t2,t3,V2,a1,a3,TT,vehicle.served(k)] = NonlinLTOsolver( vehicle.trajectory{k}(vehicle.trajPointIndx(k,2),2),...
                            vehicle.currSpeed(k),...
                            intersectionConfig.crossingSpeed(vehicle.destination(k)),...
                            intersectionConfig.safeSpeed,...
                            vehicle.maxDeccRate(k),...
                            vehicle.maxAccRate(k),...
                            [endOfGreen - (signal.nextPhasesG(phaseIndx) + signal.nextPhasesY(phaseIndx)),endOfGreen], simParameters );
                    end
                    updatedTime = updatedTime + signal.nextPhasesAR(phaseIndx);
                    phaseIndx   = phaseIndx + 1;
                end
                
                if vehicle.served(k) == 1 % VEHICLE CAN BE SERVED, BUILD THE TRAJECTORY
                    TPI              = vehicle.trajPointIndx(k,:);
                    t = 0;
                    while t <= t1 - simParameters.trajTimePrecision  % MAKE THE FIRST STAGE OF TRAJECTORY
                        t = t + simParameters.trajTimePrecision;
                        vehicle.trajPointIndx(k,2) = 1 + mod(vehicle.trajPointIndx(k,2),intersectionConfig.maxNoTrajPoint);
                        
                        vehicle.trajectory{k}(vehicle.trajPointIndx(k,2),1) = t+vehicle.trajectory{k}(TPI(2),1);
                        vehicle.trajectory{k}(vehicle.trajPointIndx(k,2),2) = round(vehicle.trajectory{k}(TPI(2),2)-...
                            (a1*t^2/2 + vehicle.currSpeed(k) * t),simParameters.distanceDecimals);
                    end
                    
                    t = t - t1;
                    dm = vehicle.trajectory{k}(TPI(2),2) - (a1*t1^2/2 + vehicle.currSpeed(k) * t1);
                    while t <= t2 - simParameters.trajTimePrecision  % MAKE THE SECOND STAGE OF TRAJECTORY
                        t = t + simParameters.trajTimePrecision;
                        vehicle.trajPointIndx(k,2) = 1 + mod(vehicle.trajPointIndx(k,2),intersectionConfig.maxNoTrajPoint);
                        
                        vehicle.trajectory{k}(vehicle.trajPointIndx(k,2),1) = t+vehicle.trajectory{k}(TPI(2),1)+t1;
                        vehicle.trajectory{k}(vehicle.trajPointIndx(k,2),2) = round(dm-V2*t,simParameters.distanceDecimals);
                    end
                    
                    Tm = t1 + t2; t = t-t2;
                    dm = dm - V2 * t2;
                    while t <= t3 - simParameters.trajTimePrecision  % MAKE THE THIRD STAGE OF TRAJECTORY
                        t = t + simParameters.trajTimePrecision;
                        vehicle.trajPointIndx(k,2) = 1 + mod(vehicle.trajPointIndx(k,2),intersectionConfig.maxNoTrajPoint);
                        
                        vehicle.trajectory{k}(vehicle.trajPointIndx(k,2),1) = t+vehicle.trajectory{k}(TPI(2),1) + Tm;
                        vehicle.trajectory{k}(vehicle.trajPointIndx(k,2),2) = round(dm - (a3*t^2/2 + V2 * t),simParameters.distanceDecimals);
                    end
                    
                    if t + Tm < TT   % ADD THE LAST POINT IF IT'S NOT ADDED
                        vehicle.trajPointIndx(k,2) = 1 + mod(vehicle.trajPointIndx(k,2),intersectionConfig.maxNoTrajPoint);
                        
                        vehicle.trajectory{k}(vehicle.trajPointIndx(k,2),1) = vehicle.trajectory{k}(TPI(2),1) + TT;
                        vehicle.trajectory{k}(vehicle.trajPointIndx(k,2),2) = round(dm - (a3*t3^2/2 + V2 * t3),simParameters.distanceDecimals);
                    end
                    
                else % VEHICLE CAN'T BE SERVED, EXTEND OR ADD A PHASE FOR IT
                    if ismember( lane, phasesLib(signal.nextPhasesSeq( end )).Lanes) % EXTEND THE LAST PHASE
                        vehicle.served(k)       = 1;
                        if vehicle.trajectory{k}(vehicle.trajPointIndx(k,2),1) + vehicle.idealTraj(k,7)  >=  updatedTime
                            t1 = vehicle.idealTraj(k,1);
                            t2 = vehicle.idealTraj(k,2);
                            t3 = vehicle.idealTraj(k,3);
                            V2 = vehicle.idealTraj(k,4);
                            a1 = vehicle.idealTraj(k,5);
                            a3 = vehicle.idealTraj(k,6);
                            TT = vehicle.idealTraj(k,7);
                            
                            endOfGreen = simParameters.globalTime+sum(signal.nextPhasesG)+sum(signal.nextPhasesY)+sum(signal.nextPhasesAR(1:end-1));
                            departTime = vehicle.trajectory{k}(vehicle.trajPointIndx(k,2),1) + TT;
                            
                            if endOfGreen < departTime
                                signal.nextPhasesG(end) = signal.nextPhasesG(end)+ departTime - endOfGreen;
                                fwrite(SCFile,[simParameters.globalTime+sum(signal.nextPhasesG(1:end-1))+sum(signal.nextPhasesY(1:end-1))+sum(signal.nextPhasesAR(1:end-1)) signal.nextPhasesSeq(end) signal.nextPhasesG(end) signal.nextPhasesY(end) signal.nextPhasesAR(end)]*1000,'int');
                            end
                        else
                            TPI              = vehicle.trajPointIndx(k,:);
                            endOfGreen = simParameters.globalTime+sum(signal.nextPhasesG)+sum(signal.nextPhasesY)+sum(signal.nextPhasesAR(1:end-1));
                            updatedTime = max(simParameters.globalTime+sum(signal.nextPhasesG(1:end-1))+sum(signal.nextPhasesY(1:end-1))+sum(signal.nextPhasesAR(1:end-1)),tStar);
                            [t1, t2, t3, V2, a1, a3, TT, vehicle.served(k)] = NonlinLTOsolver( vehicle.trajectory{k}(TPI(2),2),...
                                vehicle.currSpeed(k), ...
                                intersectionConfig.crossingSpeed(vehicle.destination(k)),...
                                intersectionConfig.safeSpeed ,...
                                vehicle.maxDeccRate(k),...
                                vehicle.maxAccRate(k),...
                                updatedTime - vehicle.trajectory{k}(vehicle.trajPointIndx(k,2),1) + [0,1000], simParameters );
                            departTime = vehicle.trajectory{k}(TPI(2),1) + TT;
                            if endOfGreen < departTime
                                signal.nextPhasesG(end) = signal.nextPhasesG(end)+ departTime - endOfGreen;
                                fwrite(SCFile,[simParameters.globalTime+sum(signal.nextPhasesG(1:end-1))+sum(signal.nextPhasesY(1:end-1))+sum(signal.nextPhasesAR(1:end-1)) signal.nextPhasesSeq(end) signal.nextPhasesG(end) signal.nextPhasesY(end) signal.nextPhasesAR(end)]*1000,'int');
                            end
                        end
                    else % JUST ADD A PHASE TO PHASE SEQ
                        TPI              = vehicle.trajPointIndx(k,:);
                        updatedTime      = simParameters.globalTime+sum(signal.nextPhasesG)+sum(signal.nextPhasesY)+sum(signal.nextPhasesAR);
                        [t1, t2, t3, V2, a1, a3, TT, vehicle.served(k)] = NonlinLTOsolver( vehicle.trajectory{k}(TPI(2),2),...
                            vehicle.currSpeed(k), ...
                            intersectionConfig.crossingSpeed(vehicle.destination(k)),...
                            intersectionConfig.safeSpeed ,...
                            vehicle.maxDeccRate(k),...
                            vehicle.maxAccRate(k),...
                            updatedTime-vehicle.trajectory{k}(TPI(2),1)+[0,1000], simParameters );
                        
                        for phaseIndx =  intersectionConfig.phaseSet % FINDE THE PHASE THAT SERVES THIS LANE
                            if ismember( lane, phasesLib(phaseIndx).Lanes)
                                signal.nextPhasesSeq = [signal.nextPhasesSeq, phaseIndx];
                                break;
                            end
                        end
                        
                        signal.nextPhasesG  = [signal.nextPhasesG, max(vehicle.trajectory{k}(TPI(2),1)+TT-updatedTime,phasesLib(signal.nextPhasesSeq(end)).MinG)];
                        signal.nextPhasesY  = [signal.nextPhasesY, intersectionConfig.Y];
                        signal.nextPhasesAR = [signal.nextPhasesAR, intersectionConfig.AR];
                        fwrite(SCFile,[simParameters.globalTime+sum(signal.nextPhasesG(1:end-1))+sum(signal.nextPhasesY(1:end-1))+sum(signal.nextPhasesAR(1:end-1)) signal.nextPhasesSeq(end) signal.nextPhasesG(end) signal.nextPhasesY(end) signal.nextPhasesAR(end)]*1000,'int');
                        
                        cardNextPhases = cardNextPhases + 1;
                        vehicle.served(k)    = 1;
                        
                    end
                    
                    TPI              = vehicle.trajPointIndx(k,:);
                    t = 0;
                    while t <= t1 - simParameters.trajTimePrecision  % MAKE THE FIRST STAGE OF TRAJECTORY
                        t = t + simParameters.trajTimePrecision;
                        vehicle.trajPointIndx(k,2) = 1 + mod(vehicle.trajPointIndx(k,2),intersectionConfig.maxNoTrajPoint);
                        
                        vehicle.trajectory{k}(vehicle.trajPointIndx(k,2),1) = t+vehicle.trajectory{k}(TPI(2),1);
                        vehicle.trajectory{k}(vehicle.trajPointIndx(k,2),2) = round(vehicle.trajectory{k}(TPI(2),2)-...
                            (a1*t^2/2 + vehicle.currSpeed(k) * t),simParameters.distanceDecimals);
                    end
                    
                    t = t - t1;
                    dm = vehicle.trajectory{k}(TPI(2),2) - (a1*t1^2/2 + vehicle.currSpeed(k) * t1);
                    while t <= t2 - simParameters.trajTimePrecision  % MAKE THE SECOND STAGE OF TRAJECTORY
                        t = t + simParameters.trajTimePrecision;
                        vehicle.trajPointIndx(k,2) = 1 + mod(vehicle.trajPointIndx(k,2),intersectionConfig.maxNoTrajPoint);
                        
                        vehicle.trajectory{k}(vehicle.trajPointIndx(k,2),1) = t+vehicle.trajectory{k}(TPI(2),1)+t1;
                        vehicle.trajectory{k}(vehicle.trajPointIndx(k,2),2) = round(dm-V2*t,simParameters.distanceDecimals);
                    end
                    
                    Tm = t1 + t2; t = t-t2;
                    dm = dm - V2 * t2;
                    while t <= t3 - simParameters.trajTimePrecision  % MAKE THE THIRD STAGE OF TRAJECTORY
                        t = t + simParameters.trajTimePrecision;
                        vehicle.trajPointIndx(k,2) = 1 + mod(vehicle.trajPointIndx(k,2),intersectionConfig.maxNoTrajPoint);
                        
                        vehicle.trajectory{k}(vehicle.trajPointIndx(k,2),1) = t+vehicle.trajectory{k}(TPI(2),1) + Tm;
                        vehicle.trajectory{k}(vehicle.trajPointIndx(k,2),2) = round(dm - (a3*t^2/2 + V2 * t),simParameters.distanceDecimals);
                    end
                    
                    if t + Tm < TT   % ADD THE LAST POINT IF IT'S NOT ADDED
                        vehicle.trajPointIndx(k,2) = 1 + mod(vehicle.trajPointIndx(k,2),intersectionConfig.maxNoTrajPoint);
                        
                        vehicle.trajectory{k}(vehicle.trajPointIndx(k,2),1) = vehicle.trajectory{k}(TPI(2),1) + TT;
                        vehicle.trajectory{k}(vehicle.trajPointIndx(k,2),2) = round(dm - (a3*t3^2/2 + V2 * t3),simParameters.distanceDecimals);
                    end
                    
                end
            end
            
        else % A CONVENTIONAL FOLLOWER NEEDS ITS TRAJECTORY
            TPI            = vehicle.trajPointIndx(j,:);
            
            OrigTPI        = vehicle.trajPointIndx(k,:);
            updatedTime    = simParameters.globalTime;
            tStar          = vehicle.trajectory{j}(vehicle.trajPointIndx(j,2),1) + intersectionConfig.minTimeHeadway;
            for phaseIndx = 1 : cardNextPhases
                updatedTime = updatedTime + signal.nextPhasesG(phaseIndx) + signal.nextPhasesY(phaseIndx);
                if ismember( lane, phasesLib(signal.nextPhasesSeq( phaseIndx )).Lanes) && ((tStar <= updatedTime && phaseIndx<cardNextPhases) ||... % HYPOTHETICALLY SAYING, THERE IS ROOM FOR ANOTHER VEHICLE
                        (phaseIndx==cardNextPhases))
                    
                    NoOfTrajPoints = mod( TPI(2) - TPI(1) + 1, intersectionConfig.maxNoTrajPoint);
                    trajCounter    = 1; m = TPI(1);
                    while vehicle.trajectory{k}(vehicle.trajPointIndx(k,2),1) > vehicle.trajectory{j}(m,1) && trajCounter <= NoOfTrajPoints
                        n = m;
                        m = 1 + mod(m,intersectionConfig.maxNoTrajPoint);
                        trajCounter  =  trajCounter  +  1;
                    end
                    
                        vf  = vehicle.currSpeed(k);
                        while trajCounter <= NoOfTrajPoints
                            
                            if vehicle.trajectory{k}(vehicle.trajPointIndx(k,2),2) > vehicle.trajectory{j}(m,2) + vehicle.length(j)
                                vfDes = vehicle.desiredSpeed(k);
                                af    = vehicle.maxAccRate(k);
                                bf    = vehicle.maxDeccRate(k) ;
                                df    = vehicle.trajectory{k}(vehicle.trajPointIndx(k,2),2);
                                dl    = vehicle.trajectory{j}(m,2);
                                bl    = vehicle.maxDeccRate(j);
                                if trajCounter > 1
                                    t1    = vehicle.trajectory{j}(n,1);
                                    t2    = vehicle.trajectory{j}(m,1);
                                    dt = t2-t1;
                                    vl = (vehicle.trajectory{j}(n,2)-vehicle.trajectory{j}(m,2))/(dt);
                                else
                                    dt = simParameters.trajTimePrecision;
                                    vl = vehicle.currSpeed(j);
                                    t2    = vehicle.trajectory{j}(m,1);
                                end
                                
                                sqrt1=(0.025+vf/vfDes);
%                                 sqrt2=(bf*dt)^2-bf*(2*(df-vehicle.length(j)-dl)-vf*dt-vl^2/bl);
                                sqrt2= bf*(-2*df+2*(dl+vehicle.length(j))+dt*(dt*bf+vf)+vl^2/bl);
                                
                                if sqrt1>=0 && sqrt2>=0
                                    vv=min(vf+2.5*af*dt*(1-vf/vfDes)*sqrt(sqrt1),bf*dt+sqrt(sqrt2));
                                    a=(vv-vf)/dt;
                                    TPI(2) = 1 + mod(vehicle.trajPointIndx(k,2),intersectionConfig.maxNoTrajPoint);
                                    vehicle.trajectory{k}(TPI(2),2) = df-(0.5*dt*(a*dt+2*vf));
                                    vehicle.trajectory{k}(TPI(2),1) = t2;
                                    TPI(1) = vehicle.trajPointIndx(k,2);
                                    vehicle.trajPointIndx(k,2) = TPI(2);
                                    vf = vv;
                                elseif sqrt1<0 && sqrt2>=0
                                    vv=bf*dt+sqrt(sqrt2);
                                    a=(vv-vf)/dt;
                                    TPI(2) = 1 + mod(vehicle.trajPointIndx(k,2),intersectionConfig.maxNoTrajPoint);
                                    vehicle.trajectory{k}(TPI(2),2)=df-(0.5*dt*(a*dt+2*vf));
                                    vehicle.trajectory{k}(TPI(2),1) = t2;
                                    TPI(1) = vehicle.trajPointIndx(k,2);
                                    vehicle.trajPointIndx(k,2) = TPI(2);
                                    vf = vv;
                                elseif sqrt1>=0 && sqrt2<0
                                    vv=vf+2.5*af*dt*(1-vf/vfDes)*sqrt(sqrt1);
                                    a=(vv-vf)/dt;
                                    TPI(2) = 1 + mod(vehicle.trajPointIndx(k,2),intersectionConfig.maxNoTrajPoint);
                                    vehicle.trajectory{k}(TPI(2),2)=df-(0.5*dt*(a*dt+2*vf));
                                    vehicle.trajectory{k}(TPI(2),1) = t2;
                                    TPI(1) = vehicle.trajPointIndx(k,2);
                                    vehicle.trajPointIndx(k,2) = TPI(2);
                                    vf = vv;
                                else
                                    TPI(2) = 1 + mod(vehicle.trajPointIndx(k,2),intersectionConfig.maxNoTrajPoint);
                                    vehicle.trajectory{k}(TPI(2),2)=dl+vehicle.length(j);
                                    vv=(df-vehicle.trajectory{k}(TPI(2),2))/dt;
                                    vehicle.trajectory{k}(TPI(2),1) = t2;
                                    TPI(1) = vehicle.trajPointIndx(k,2);
                                    vehicle.trajPointIndx(k,2) = TPI(2);
                                    vf = vv;
                                end
                                if vehicle.trajectory{k}(TPI(2),2)<vehicle.trajectory{j}(m,2)+vehicle.length(j)
                                    vehicle.trajectory{k}(TPI(2),2)=vehicle.trajectory{j}(m,2)+vehicle.length(j);
                                    vv=(vehicle.trajectory{k}(TPI(1),2)-vehicle.trajectory{k}(TPI(2),2))/dt;
                                    vehicle.trajectory{k}(TPI(2),1) = t2;
                                    vf = vv;
                                end
                           else
                                TPI(2) = 1 + mod(vehicle.trajPointIndx(k,2),intersectionConfig.maxNoTrajPoint);
                                vv = 0;
                                vehicle.trajectory{k}(TPI(2),2)=vehicle.trajectory{k}(vehicle.trajPointIndx(k,2),2);
                                vehicle.trajectory{k}(TPI(2),1) = vehicle.trajectory{j}(m,1);
                                TPI(1) = vehicle.trajPointIndx(k,2);
                                vehicle.trajPointIndx(k,2) = TPI(2);
                                vf = vv;
                            end
                            
                            n = m ;
                            m = 1 + mod(m,intersectionConfig.maxNoTrajPoint);
                            trajCounter  =  trajCounter  +  1;
                        end
                    
                    departTime = vehicle.trajectory{k}(vehicle.trajPointIndx(k,2),1) ...
                        + vehicle.trajectory{k}(vehicle.trajPointIndx(k,2),2)/vehicle.desiredSpeed(k);
                    
                    if tStar <= departTime
                        v = vehicle.desiredSpeed(k);
                    else
                        v = vehicle.trajectory{k}(vehicle.trajPointIndx(k,2),2)/(tStar - vehicle.trajectory{k}(vehicle.trajPointIndx(k,2),1));
                        departTime = tStar;
                    end
                    
                    while vehicle.trajectory{k}(vehicle.trajPointIndx(k,2),1) + simParameters.trajTimePrecision <= departTime  % MAKE IT TO STOP BAR
                        t = vehicle.trajectory{k}(vehicle.trajPointIndx(k,2),1) + simParameters.trajTimePrecision;
                        d = vehicle.trajectory{k}(vehicle.trajPointIndx(k,2),2);
                        vehicle.trajPointIndx(k,2) = 1 + mod(vehicle.trajPointIndx(k,2),intersectionConfig.maxNoTrajPoint);
                        
                        vehicle.trajectory{k}(vehicle.trajPointIndx(k,2),1) = t;
                        vehicle.trajectory{k}(vehicle.trajPointIndx(k,2),2) = round(d-v*simParameters.trajTimePrecision,simParameters.distanceDecimals);
                    end
                    if vehicle.trajectory{k}(vehicle.trajPointIndx(k,2),1) < departTime
                        vehicle.trajPointIndx(k,2) = 1 + mod(vehicle.trajPointIndx(k,2),intersectionConfig.maxNoTrajPoint);
                        vehicle.trajectory{k}(vehicle.trajPointIndx(k,2),1) = departTime;
                        vehicle.trajectory{k}(vehicle.trajPointIndx(k,2),2) = 0;
                    end
                    if departTime <= updatedTime
                        vehicle.served(k)=1;
                    elseif phaseIndx == cardNextPhases
                        vehicle.served(k)=1;
                        signal.nextPhasesG(end) = signal.nextPhasesG(end)+departTime-updatedTime;
                        fwrite(SCFile,[simParameters.globalTime+sum(signal.nextPhasesG(1:end-1))+sum(signal.nextPhasesY(1:end-1))+sum(signal.nextPhasesAR(1:end-1)) signal.nextPhasesSeq(end) signal.nextPhasesG(end) signal.nextPhasesY(end) signal.nextPhasesAR(end)]*1000,'int');
                    end
                    
                    break; % HALT THE FOR SEARCH ON PHASES
                else
                    if vehicle.trajectory{j}(vehicle.trajPointIndx(j,2),1) <= updatedTime
                        break;
                    else
                        updatedTime = updatedTime + signal.nextPhasesAR(phaseIndx);
                    end
                end
            end
            if vehicle.served(k)==0
                vehicle.trajPointIndx(k,:) = OrigTPI;
                begPhase = phaseIndx + 1;
                departTime = updatedTime+ signal.nextPhasesAR(phaseIndx);
                for phaseIndx = begPhase : cardNextPhases
                    if ismember( lane, phasesLib(signal.nextPhasesSeq( phaseIndx )).Lanes)
                        v = vehicle.trajectory{k}(vehicle.trajPointIndx(k,2),2)/(departTime-vehicle.trajectory{k}(vehicle.trajPointIndx(k,2),1));
                        
                        while vehicle.trajectory{k}(vehicle.trajPointIndx(k,2),1) + simParameters.trajTimePrecision <= departTime  % MAKE IT TO STOP BAR
                            t = vehicle.trajectory{k}(vehicle.trajPointIndx(k,2),1) + simParameters.trajTimePrecision;
                            d = vehicle.trajectory{k}(vehicle.trajPointIndx(k,2),2);
                            vehicle.trajPointIndx(k,2) = 1 + mod(vehicle.trajPointIndx(k,2),intersectionConfig.maxNoTrajPoint);
                            
                            vehicle.trajectory{k}(vehicle.trajPointIndx(k,2),1) = t;
                            vehicle.trajectory{k}(vehicle.trajPointIndx(k,2),2) = round(d-v*simParameters.trajTimePrecision,simParameters.distanceDecimals);
                        end
                        if vehicle.trajectory{k}(vehicle.trajPointIndx(k,2),1) < departTime
                            vehicle.trajPointIndx(k,2) = 1 + mod(vehicle.trajPointIndx(k,2),intersectionConfig.maxNoTrajPoint);
                            vehicle.trajectory{k}(vehicle.trajPointIndx(k,2),1) = departTime;
                            vehicle.trajectory{k}(vehicle.trajPointIndx(k,2),2) = 0;
                        end
                        vehicle.served(k)=1;
                        break;
                    end
                    departTime = departTime + signal.nextPhasesG(phaseIndx) + signal.nextPhasesY(phaseIndx)+ signal.nextPhasesAR(phaseIndx);
                end
                if vehicle.served(k) == 0
                    vehicle.served(k)=1;
                    departTime = simParameters.globalTime+sum(signal.nextPhasesG)+sum(signal.nextPhasesY)+sum(signal.nextPhasesAR)+3;
                    v = vehicle.trajectory{k}(vehicle.trajPointIndx(k,2),2)/(departTime-vehicle.trajectory{k}(vehicle.trajPointIndx(k,2),1));
                    
                    while vehicle.trajectory{k}(vehicle.trajPointIndx(k,2),1) + simParameters.trajTimePrecision <= departTime  % MAKE IT TO STOP BAR
                        t = vehicle.trajectory{k}(vehicle.trajPointIndx(k,2),1) + simParameters.trajTimePrecision;
                        d = vehicle.trajectory{k}(vehicle.trajPointIndx(k,2),2);
                        vehicle.trajPointIndx(k,2) = 1 + mod(vehicle.trajPointIndx(k,2),intersectionConfig.maxNoTrajPoint);
                        
                        vehicle.trajectory{k}(vehicle.trajPointIndx(k,2),1) = t;
                        vehicle.trajectory{k}(vehicle.trajPointIndx(k,2),2) = round(d-v*simParameters.trajTimePrecision,simParameters.distanceDecimals);
                    end
                    if vehicle.trajectory{k}(vehicle.trajPointIndx(k,2),1) < departTime
                        vehicle.trajPointIndx(k,2) = 1 + mod(vehicle.trajPointIndx(k,2),intersectionConfig.maxNoTrajPoint);
                        vehicle.trajectory{k}(vehicle.trajPointIndx(k,2),1) = departTime;
                        vehicle.trajectory{k}(vehicle.trajPointIndx(k,2),2) = 0;
                    end
                    
                    
                    for phaseIndx =  intersectionConfig.phaseSet % FIND THE PHASE THAT SERVES THIS LANE
                        if ismember( lane, phasesLib(phaseIndx).Lanes)
                            signal.nextPhasesSeq = [signal.nextPhasesSeq, phaseIndx];
                            break;
                        end
                    end
                    
                    signal.nextPhasesG  = [signal.nextPhasesG, phasesLib(signal.nextPhasesSeq(end)).MinG];
                    signal.nextPhasesY  = [signal.nextPhasesY, intersectionConfig.Y];
                    signal.nextPhasesAR = [signal.nextPhasesAR, intersectionConfig.AR];
                    fwrite(SCFile,[simParameters.globalTime+sum(signal.nextPhasesG(1:end-1))+sum(signal.nextPhasesY(1:end-1))+sum(signal.nextPhasesAR(1:end-1)) signal.nextPhasesSeq(end) signal.nextPhasesG(end) signal.nextPhasesY(end) signal.nextPhasesAR(end)]*1000,'int');
                    
                    cardNextPhases = cardNextPhases + 1;
                    
                end
            end
            TT = vehicle.trajectory{k}(vehicle.trajPointIndx(k,2),1) - vehicle.trajectory{k}(vehicle.trajPointIndx(k,1),1);
            if TT < vehicle.idealTraj(k,7)
                vehicle.idealTraj(k,:) = [0,0,0,0,0,0,TT];
            end
        end
    end
    j = k;  % SET THE LEAD VEHICLE INDEX FOR NEXT VEHICLE
end

end
