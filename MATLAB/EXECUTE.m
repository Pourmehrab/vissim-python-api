clc
clear all;

% By: Mahmoud Pouremhrab
% Email: mpourmehrab@ufl.edu

%% Connecting the COM Server => Open a new Vissim Window:
Vissim = actxserver('Vissim.Vissim-64.800');

Path_of_VISSIM_files = strcat(cd, '\VISSIM-model'); % VISSIM folder

%% ========================================================================
% Loading
%==========================================================================
%% Load a Vissim Network:
Filename                = fullfile(Path_of_VISSIM_files, '13thAND16th.inpx');
flag_read_additionally  = false; % you can read network(elements) additionally, in this case set "flag_read_additionally" to true
Vissim.LoadNet(Filename, flag_read_additionally);

%% Load a Layout:
Filename = fullfile(Path_of_VISSIM_files, '13thAND16th.layx');
Vissim.LoadLayout(Filename);

%% ========================================================================
% Network Configuration
%==========================================================================
% 1 SB; 2 EB; 3 NB; 4 WB
% 1 right turn; 2 through; 3 left turn

% Set Flow (Unit?):
Vissim.Net.VehicleInputs.SetAllAttValues('Volume(1)',500)

%% ========================================================================
% Simulation Parameters
%==========================================================================
% Chose Random Seed
Random_Seed = randi(1000);
set(Vissim.Simulation, 'AttValue', 'RandSeed', Random_Seed);

% Or run the simulation continuous (it stops at breakpoint or end of simulation)
End_of_simulation = 15 * 60; % simulation second [s]
set(Vissim.Simulation, 'AttValue', 'SimPeriod', End_of_simulation);
% Set maximum speed:
set(Vissim.Simulation, 'AttValue', 'UseMaxSimSpeed', true);
% Hint: to change the speed use: set(Vissim.Simulation, 'AttValue', 'SimSpeed', 10); % 10 => 10 Sim. sec. / s
Vissim.Simulation.RunSingleStep;

%% ========================================================================
% Signal Controller
%==========================================================================
% Get the state of a signal head:
SH_number = 1; % SH = SignalHead
State_of_SH = get(Vissim.Net.SignalHeads.ItemByKey(SH_number), 'AttValue', 'SigState'); % possible output e.g. 'GREEN', 'RED', 'AMBER', 'REDAMBER'
disp(['Actual state of SignalHead(',num2str(SH_number),') is:',32,State_of_SH]) % char(32) is whitespace

Sim_break_at = 1*60 % simulation second [s]
set(Vissim.Simulation, 'AttValue', 'SimBreakAt', Sim_break_at);
Vissim.Simulation.RunContinuous; % Start the simulation until SimBreakAt (198s)


% Set the state of a signal controller:
% Note: Once a state of a signal group is set, the attribute "ContrByCOM" is automatically set to True. Meaning the signal group will keep this state until another state is set by COM or the end of the simulation
% To switch back to the defined signal controller, set the attribute signal "ContrByCOM" to False (example see below).
SC_number = 1; % SC = SignalController
SG_number = 1; % SG = SignalGroup
SignalController = Vissim.Net.SignalControllers.ItemByKey(SC_number);
SignalGroup = SignalController.SGs.ItemByKey(SG_number);
new_state = 'GREEN'; %possible values e.g. 'GREEN', 'RED', 'AMBER', 'REDAMBER'
set(SignalGroup, 'AttValue', 'SigState', new_state);

Vissim.Simulation.RunSingleStep;
Vissim.Simulation.RunSingleStep;
Vissim.Simulation.RunSingleStep;
Vissim.Simulation.RunSingleStep;
Vissim.Simulation.RunSingleStep;


%% ========================================================================
% End Vissim
%==========================================================================
Vissim.release
display('done.')
