clc
clear all;

% By: Mahmoud Pouremhrab
% Email: mpourmehrab@ufl.edu

%% Path management
p = pwd;
f = filesep;

addpath(genpath([p f 'trajectory-optimizer']),...
    genpath([p f 'traffic-sim']),genpath([p f 'VISSIM-MATLAB']));

load('VissimData.mat');

%% Connecting the COM Server => Open a new Vissim Window:
Vissim = actxserver('Vissim.Vissim-64.800');

Path_of_VISSIM_files = strcat(cd, '\VISSIM-model'); % VISSIM folder

%% ========================================================================
% Loading
%==========================================================================
%% Load a Vissim Network:
Name = '13thAND16th';
Filename                = fullfile(Path_of_VISSIM_files, strcat(Name,'.inpx'));
flag_read_additionally  = false; % you can read network(elements) additionally, in this case set "flag_read_additionally" to true
Vissim.LoadNet(Filename, flag_read_additionally);

%% Load a Layout:
Filename = fullfile(Path_of_VISSIM_files, strcat(Name,'.layx'));
Vissim.LoadLayout(Filename);

%% ========================================================================
% Network Configuration
%==========================================================================

adjustNetwork;


initialSimParam;

%% ========================================================================
% Signal Controller Interface
%==========================================================================

greenSGs = [ 2, 4, 7 ];

switchSignal( Vissim, 1, greenSGs )

%% ========================================================================
% Vehicle Interface
%==========================================================================
All_Vehicles    = Vissim.Net.Vehicles.GetAll; % get all vehicles in the network at the actual simulation second
Vehicle         = All_Vehicles{1};

% get link, lane, distance, type, speed for an specific ID: here 'No'
get(All_Vehicles{1}.Lane,'AttValue','Link');
get(All_Vehicles{1},'AttValue','Lane');
get(All_Vehicles{1},'AttValue','Pos');
get(All_Vehicles{1},'AttValue','VehType');
get(All_Vehicles{1},'AttValue','Speed');

Vissim.Simulation.SimulationSecond
get(All_Vehicles{1},'AttValue','No');

All_Vehicles{1}.NextLink
% Set desired speed to a vehicle:
new_desspeed = 30;
set(Vehicle, 'AttValue', 'DesSpeed', new_desspeed);

% Move a vehicle:
link_number     = 17;
lane_number     = 1;
link_coordinate = 910;
Vehicle.MoveToLinkPosition(link_number, lane_number, link_coordinate); % This function will operate during the next simulation step
% Hint: In earlier Vissim releases, the name of the function was: MoveToLinkCoordinate

Vissim.Simulation.RunSingleStep;

display('done.')



%% ========================================================================
% End Vissim
%==========================================================================
Vissim.release
