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
VissimData.OptRange = zeros(size(VissimData.NumLanes));

for ii = 1:VissimData.NumLinks
    VissimData.OptRange(ii) = get(Vissim.Net.Links.ItemByKey(ii),'AttValue'...
        ,'length2D') - dr ;
end