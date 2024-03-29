% clc
% clear
% close('all');
% fclose('all');
% delete('*.bin','*.png','*.mat','*.asv')

%% SCENARIO'S DETAIL
% sc                          =           1; % COMMENT THIS FOR BATCH RUN

commRange                   =           1000;
% AveHeadway                  =           8; % COMMENT THIS FOR BATCH RUN
AVPercent                   =           1;

simEndTime                  =           15 * 60;

%% INTERSECTION LAYOUT
phasesLib                  =    [...
    struct('Lanes',[1] , 'MinG',4.6,'MaxG',25);
    struct('Lanes',[4] , 'MinG',4.6,'MaxG',25);
    struct('Lanes',[2 5],'MinG',4.6,'MaxG',25);
    struct('Lanes',[2 3],'MinG',4.6,'MaxG',25);
    struct('Lanes',[5 6],'MinG',4.6,'MaxG',25);
    struct('Lanes',[3 6],'MinG',4.6,'MaxG',25)];

sysTime = datetime(datevec(datetime('now'))-[0 0 0 0 0 0]); % DEFINE HOW MUCH SOONER SIMULATION STARTS (COMPARED TO TRAFFIC GENERATION)
simParameters           =   struct('trajTimePrecision',1,'globalTime',0,'timeDecimals',3,...
    'distanceDecimals',2,'speedDecimals',2,...
    'refFullTime',[sysTime.Hour sysTime.Minute sysTime.Second]);

intersectionConfig      =     struct(...
    'NoOfLanes',6 ...
    ,'NoOfPhases',length(phasesLib)...
    ,'safeSpeed',round(40*5280/3600,simParameters.speedDecimals)...
    ,'crossingSpeed',round([30 40 30]*5280/3600,simParameters.speedDecimals)... % COMPATIBLE TO DESTINATION VECTOR
    ,'Y', 1.5...
    ,'AR',1.5 ...
    ,'phaseSet',[1,2,4,5]... % LIMIT THE PHASES TO THE LIMITED SET THAT COVERS ALL MOVEMENTS
    ,'maxNoVehsPerLane', ceil(commRange/15)*10 ...
    );
    intersectionConfig.minSpeed = round(0.85*intersectionConfig.safeSpeed,simParameters.speedDecimals);
    intersectionConfig.maxNoTrajPoint =  ceil(commRange/(intersectionConfig.minSpeed * simParameters.trajTimePrecision)) * 100;
    intersectionConfig.minTimeHeadway = 2;

genVehicles                =     repmat(struct(...
    'ID',                       {cell(intersectionConfig.maxNoVehsPerLane,1)}...
    ,'type',                    zeros(intersectionConfig.maxNoVehsPerLane,1)...
    ,'vehIndx',                 zeros(1,2)...
    ,'initTime',                zeros(intersectionConfig.maxNoVehsPerLane,1)...
    ,'length',                  zeros(intersectionConfig.maxNoVehsPerLane,1)...
    ,'maxAccRate',              zeros(intersectionConfig.maxNoVehsPerLane,1)...
    ,'maxDeccRate',             zeros(intersectionConfig.maxNoVehsPerLane,1)...
    ,'destination',             zeros(intersectionConfig.maxNoVehsPerLane,1)...
    ,'currSpeed',               zeros(intersectionConfig.maxNoVehsPerLane,1)...
    ,'desiredSpeed',            zeros(intersectionConfig.maxNoVehsPerLane,1)...
    ,'trajectory',              {cell(intersectionConfig.maxNoVehsPerLane,1)}...
    ,'trajPointIndx',           zeros(intersectionConfig.maxNoVehsPerLane,2)...
    ,'commRange',               commRange...
    ,'served',                  zeros(intersectionConfig.maxNoVehsPerLane,1)...
    ,'trajReceived',            zeros(intersectionConfig.maxNoVehsPerLane,1)...
    ,'idealTraj',               zeros(intersectionConfig.maxNoVehsPerLane,7)),intersectionConfig.NoOfLanes,1);

vehicles = genVehicles;
for i=1:intersectionConfig.NoOfLanes
    vehicles(i).trajectory(:)     =       {zeros(intersectionConfig.maxNoTrajPoint,2)};
end

for i=1:intersectionConfig.NoOfLanes
    genVehicles(i).initTime     =       zeros(intersectionConfig.maxNoVehsPerLane,3);
    genVehicles(i).distance     =       zeros(intersectionConfig.maxNoVehsPerLane,1);
end

%% CALL THE FUNCTION
[FullListOfVeh,MeanSD] = TRAFFIC_GENERATOR_scenarioGenerator(simEndTime,genVehicles,...
    intersectionConfig.minSpeed,intersectionConfig.safeSpeed,...
    round(intersectionConfig.safeSpeed*1.1,simParameters.speedDecimals)...
    ,intersectionConfig.NoOfLanes,commRange,AveHeadway,AVPercent);
%% EXPORT THE RESULT FOR SIMULATION
% str         =       ['scenario',num2str(sc),'_input.mat'];
% save(str,'FullListOfVeh','simEndTime','intersectionConfig','MeanSD'...
%     ,'phasesLib','simParameters','intersectionConfig','vehicles','AVPercent','commRange');
% % close all;

