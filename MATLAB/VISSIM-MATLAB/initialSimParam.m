%% Modify the Simulation Parameters

% Chose Random Seed
Random_Seed = randi(1000);
set(Vissim.Simulation, 'AttValue', 'RandSeed', Random_Seed);

% Set a signal controller program:
SC_number = 1; % SC = SignalController
SignalController = Vissim.Net.SignalControllers.ItemByKey(SC_number);
new_signal_programm_number = 1;
set(SignalController, 'AttValue', 'ProgNo', new_signal_programm_number);

% Or run the simulation continuous (it stops at breakpoint or end of simulation)
End_of_simulation = 15 * 60; % simulation second [s]
set(Vissim.Simulation, 'AttValue', 'SimPeriod', End_of_simulation);
% Set maximum speed:
set(Vissim.Simulation, 'AttValue', 'UseMaxSimSpeed', true);
% Hint: to change the speed use: set(Vissim.Simulation, 'AttValue', 'SimSpeed', 10); % 10 => 10 Sim. sec. / s
% set simulation resolution to a small number to have nice and smooth
% signal swithes
set(Vissim.Simulation, 'AttValue', 'SimRes', 0.5);

Vissim.Simulation.RunSingleStep;
