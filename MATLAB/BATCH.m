clc;
clear;
close('all');
fclose('all');
delete('*.bin','*.png','*.mat')

sc = 0;

average_headway =   60:-(60-8)/9:8;
comm_distance   =   3000:-(3000-500)/9:500;
CAV_percentage  =   1:-(1-0.3)/9:0.3;

RESULT = zeros(1000,5);
aggTravelTime = zeros(1000,6);
minHW = [2, 1.5, 1];

for  AveHeadway = average_headway
    % generate Traffic for default case : commRange = 3000 and CAV_percentage = 1;
    totalNoOfVehs = 10e10;
    totalAverageHeadway = 0;
    while totalAverageHeadway<(AveHeadway-1)*totalNoOfVehs || totalAverageHeadway>(AveHeadway+1)*totalNoOfVehs
        TRAFFIC_GENERATOR_Main;
        totalNoOfVehs = 0;
        totalAverageHeadway = 0;
        for lane  =  1:intersectionConfig.NoOfLanes
            totalNoOfVehs = totalNoOfVehs + FullListOfVeh(lane).lastVehIndx;
            totalAverageHeadway = totalAverageHeadway + FullListOfVeh(lane).lastVehIndx * MeanSD(lane,1);
        end
    end
    
    for AVPercent = CAV_percentage
        for lane  =  1:intersectionConfig.NoOfLanes
            A                   =       ones(floor(AVPercent*FullListOfVeh(lane).lastVehIndx),1);
            A   =                       [A;zeros(FullListOfVeh(lane).lastVehIndx-length(A),1)];
            FullListOfVeh(lane).type(1:FullListOfVeh(lane).lastVehIndx)   =       A(randperm(FullListOfVeh(lane).lastVehIndx));
            MinSpeed = 49.87; ModeSpeed = 58.67;
            FullListOfVeh(lane).desiredSpeed    =  MinSpeed + FullListOfVeh(lane).type*(ModeSpeed-MinSpeed);
        end
        
        for commRange = comm_distance
            
            for lane  =  1:intersectionConfig.NoOfLanes
                for veh = 1:FullListOfVeh(lane).lastVehIndx
                    FullListOfVeh(lane).distance(veh)  =  commRange;
                end
            end
            
            for     jj = 1:3
                sc          =       sc      +       1;
                intersectionConfig.minTimeHeadway = minHW(jj);
                
                fprintf('scenario %d with headway:%d commRange:%d AVPercent:%d is generated.\n',sc,AveHeadway,commRange,AVPercent*100);
                
                str         =       ['scenario',num2str(sc),'_input.mat'];
                save(str,'FullListOfVeh','simEndTime','intersectionConfig','MeanSD'...
                    ,'phasesLib','simParameters','intersectionConfig','vehicles','AVPercent','commRange');
                
                RESULT(sc,1:4)      =  [jj, 3600/(totalAverageHeadway/totalNoOfVehs), commRange, AVPercent];
                
                % run the simulation and record the required statistics;
                MAIN;
                fprintf('scenario %d was simulated SUCCESSFULLY*****\n\n',sc);
                
                tableGenerator;
                
            end
        end
    end
    %     clearvars -except AveHeadway commRange AVPercent sc RESULT aggTravelTime
    
end
save('FINALRESULT.mat');

%     extractOutputs;
