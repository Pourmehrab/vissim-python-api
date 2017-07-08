clc;
clear;
close('all');
fclose('all');

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

% Load Matlab Config file
load(strcat(Name,'Config'));

%% Load a Layout:
Filename = fullfile(Path_of_VISSIM_files, strcat(Name,'.layx'));
Vissim.LoadLayout(Filename);

%% initiate looping
sc = 0;

numSim                  =   15                          ;
End_of_simulation       =   30 * 60 * 2                 ;    % simulation second [s]: 15 min warmup period
% 15 min data collection, up to 30 min for network evacuation
End_of_veh_input        =   0.5 * End_of_simulation     ;  

SimRes                  =   1                          ;    % number of steps in a sec
% the inverse of this should not exceed trajectory resolution


flowVol                 =   50:(450-50)/9:450           ;
detRange                =   1500:-(1500-500)/9:500      ;
CAVratio                =   0.99:-(0.99-0.1)/9:0.01            ;

minHW                   =   [ 1.0, 1.5, 2.0 ]           ;

for  f = flowVol
    for r = CAVratio
        for dr = detRange
            %% ============================================================
            % Network Configuration
            %==============================================================

            adjustNetwork;
            
            
            initialSimParam;
            
            %% ============================================================
            % Run Simulation
            %==============================================================
            sc          =       sc      +       1;
            MAIN;
            
        end
    end
    
end
%% ========================================================================
% End Vissim
%==========================================================================
Vissim.release
