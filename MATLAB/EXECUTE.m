clc
clear all;

% By: Mahmoud Pouremhrab
% Email: mpourmehrab@ufl.edu

%% Path management
p = pwd;
f = filesep;

addpath(genpath([p f 'trajectory-optimizer']),...
    genpath([p f 'traffic-sim']),genpath([p f 'VISSIM-MATLAB']));



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

adjustNetwork

%% ========================================================================
% Simulation Parameters
%==========================================================================

initialSimParam

%% ========================================================================
% Signal Controller
%==========================================================================

greenSGs = [7,2,4];

switchSignal( Vissim, 1, greenSGs )

Vissim.Simulation.RunSingleStep;


%% ========================================================================
% End Vissim
%==========================================================================
Vissim.release
display('done.')
