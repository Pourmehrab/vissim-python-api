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

% Load Matlab Config file
load(strcat(Name,'Config'));

%% Load a Layout:
Filename = fullfile(Path_of_VISSIM_files, strcat(Name,'.layx'));
Vissim.LoadLayout(Filename);

%% initiate looping
sc = 0;

numSim                  =   15                          ;
End_of_simulation       =   30 * 60                     ;    % simulation second [s]: 15 min warmup period
SimRes                  =   1                          ;    % number of steps in a sec


flowVol                 =   50:(450-50)/9:450           ;
detRange                =   1500:-(1500-500)/9:500      ;
CAVratio                =   1:-(1-0.3)/9:0.3            ;

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
    %     clearvars -except AveHeadway commRange AVPercent sc RESULT aggTravelTime
    
end
save('FINALRESULT.mat');

%     extractOutputs;
