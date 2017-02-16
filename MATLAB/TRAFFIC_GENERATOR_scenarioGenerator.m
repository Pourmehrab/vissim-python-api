function [ Result,MeanSD ] = TRAFFIC_GENERATOR_scenarioGenerator( simEndTime,vehicles,MinSpeed,ModeSpeed,MaxSpeed,NoOfLanes,CommRadius,AveHeadway,AutoPercent )

Result              =       vehicles;

refTime = datetime('now');

triangularDist = makedist('Triangular','a',MinSpeed,'b',ModeSpeed,'c',MaxSpeed);

v = zeros(6,1000);

MeanSD = zeros(NoOfLanes,2);

tempID=0;
movementShare = [1/3 1/3 1/3;0 1/2 1/2;0 0 1;1/3 1/3 1/3;0 1/2 1/2;1 0 0];
for lane=1:NoOfLanes
    
    t=[];
    time = 0;
    interArrival = [];
    currTime=refTime;
    Result(lane).lastVehIndx = 0;

%     if lane == 2 || lane == 3
% %     if lane == 1
%         continue;
%     end
    
    while time <= simEndTime
        
        Result(lane).lastVehIndx = Result(lane).lastVehIndx  +  1;
        
        
        Result(lane).maxAccRate(Result(lane).lastVehIndx)   =    10  ;
        Result(lane).maxDeccRate(Result(lane).lastVehIndx)  =   -15 ;
        
        dt   = max([round(exprnd(AveHeadway),1),2]); % NO LESS THAN 2 SEC OF INTERARRIVALS
        time = time + dt;
        interArrival = [interArrival;dt];
        currTime.Second=currTime.Second+dt;
        t  =  [t ; time];
        Result(lane).initTime(Result(lane).lastVehIndx,:)        =  [currTime.Hour currTime.Minute currTime.Second];
        
        if Result(lane).lastVehIndx>1
            Result(lane).currSpeed(Result(lane).lastVehIndx)  =  min(round(random(triangularDist),1),...
                Result(lane).currSpeed(Result(lane).lastVehIndx-1)+(MaxSpeed-Result(lane).currSpeed(Result(lane).lastVehIndx-1))*(dt-2)/10);
        else
            Result(lane).currSpeed(Result(lane).lastVehIndx)  =  round(random(triangularDist),1);
        end
        
        tempID=tempID+1;
        Result(lane).ID(Result(lane).lastVehIndx)  =  {tempID};
        
        Result(lane).length(Result(lane).lastVehIndx)  =  15; % length of vehicle
        
%         Result(lane).distance(Result(lane).lastVehIndx)  =  CommRadius+round((rand-0.5)*10,0);
        Result(lane).distance(Result(lane).lastVehIndx)  =  CommRadius;
    end
    
%     pd = fitdist(diff(t),'Exponential');
    MeanSD(lane,:)      =       [round(mean(interArrival),1),round(std(interArrival),1)];
    NoOfVeh             =       Result(lane).lastVehIndx;
    A                   =       ones(floor(AutoPercent*NoOfVeh),1);
    A   =                       [A;zeros(NoOfVeh-length(A),1)];
    Result(lane).type(1:Result(lane).lastVehIndx)   =       A(randperm(NoOfVeh));
    Result(lane).desiredSpeed    =  MinSpeed + Result(lane).type*(ModeSpeed-MinSpeed);
    
    p = round(NoOfVeh * movementShare(lane,:),0);
    p(2)=NoOfVeh-p(1)-p(3);
    A = [ones(p(1),1);2*ones(p(2),1);3*ones(p(3),1)];
    Result(lane).destination(1:Result(lane).lastVehIndx)   =       A(randperm(NoOfVeh));
  
end

end

