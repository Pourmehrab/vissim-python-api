%% Modify the Simulation Parameters

% Chose Random Seed
% Random_Seed = randi(1000);
% set(Vissim.Simulation, 'AttValue', 'RandSeed', Random_Seed);

% Set a signal controller program:
SC_number = 1; % SC = SignalController
SignalController = Vissim.Net.SignalControllers.ItemByKey(SC_number);
new_signal_programm_number = 1;
set(SignalController, 'AttValue', 'ProgNo', new_signal_programm_number);

% Or run the simulation continuous (it stops at breakpoint or end of simulation)
set(Vissim.Simulation, 'AttValue', 'SimPeriod', End_of_simulation);
% Set maximum speed:
set(Vissim.Simulation, 'AttValue', 'UseMaxSimSpeed', true);
% Hint: to change the speed use: set(Vissim.Simulation, 'AttValue', 'SimSpeed', 10); % 10 => 10 Sim. sec. / s
% set simulation resolution to a small number to have nice and smooth
% signal swithes
set(Vissim.Simulation, 'AttValue', 'SimRes', SimRes);


% Vissim.Simulation.RunSingleStep;

% Sim_break_at = 200; % simulation second [s]
% set(Vissim.Simulation, 'AttValue', 'SimBreakAt', Sim_break_at);
% Vissim.Simulation.RunContinuous; % Start the simulation until SimBreakAt (200s)


% Extract link lenghts from Vissim model
VissimData.OptRange = zeros(intersectionConfig.NoOfLanes,1);
VissimData.LaneLength = zeros(intersectionConfig.NoOfLanes,1);

map = [1,2,2,3,4,5,6,7,8,9,9,10,11,11,12,12];
Vissim.Net.DataCollectionPoints.SetAllAttValues('Pos',0);
for lane = 1:intersectionConfig.NoOfLinks
    laneLength = get(Vissim.Net.Links.ItemByKey(lane),'AttValue','length2D');
    VissimData.OptRange(lane) = laneLength - dr ;
    
    %     YOU NEED LANE NO, NOT LINK NO FOR THIS
    %     set(Vissim.Net.DataCollectionPoints.ItemByKey(lane), 'AttValue', 'Pos',VissimData.OptRange(lane));
    
    VissimData.LaneLength(lane) = laneLength;
    set(Vissim.Net.VehicleTravelTimeMeasurements.ItemByKey( lane ),'AttValue','StartPos',VissimData.OptRange(lane));
    set(Vissim.Net.VehicleTravelTimeMeasurements.ItemByKey( lane ),'AttValue','EndPos',laneLength);
end

