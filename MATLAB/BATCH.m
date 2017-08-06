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
Vissim = actxserver('Vissim.Vissim-64.900');

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

%% initiate looping
sc = 0;

numSim                  =   1                          ;
End_of_simulation       =   25  * 60             ;    % simulation second [s]: 15 min warmup period
% 15 min data collection, up to 30 min for network evacuation
% End_of_veh_input        =   0.5 * End_of_simulation     ;

SimRes                  =   1                          ;    % number of steps in a sec
% the inverse of this should not exceed trajectory resolution


flowVol                 =   50:(350-50)/4:350           ;
CAVratio                =   0.99:-(0.99-0.1)/4:0.01     ;
detRange                =   1800:-(1500-500)/4:750      ;

minHW                   =   [ 1.0, 1.5, 2.0 ]           ;

TravelTimeRes = [];
for  f = flowVol
    for r = CAVratio
        for dr = detRange
            for simCounter = 1:numSim;
                sc          =       sc      +       1; % used as random seed
                TravelTimeRes = [TravelTimeRes;[sc simCounter r f dr -1]];
            end
        end
    end
end


for  scIndx = 1:size(TravelTimeRes,1)
    
    % Load Matlab Config file
    load(strcat(Name,'Config'));
    
    %% ============================================================
    % Network Configuration
    %==============================================================
    sc          =       TravelTimeRes(scIndx,1); % used as random seed
    r  =  TravelTimeRes(scIndx,3);
    f  =  TravelTimeRes(scIndx,4);
    dr =  TravelTimeRes(scIndx,5);
    adjustNetwork;
    
    initialSimParam;
    
    %% ============================================================
    % Run Simulation
    %==============================================================
    % Vissim.SuspendUpdateGUI; %  stop updating of the complete Vissim workspace (network editor, list, chart and signal time table windows)
    TT      =   0;
    Nserved =   0;
    %                 dr      =   722; f = 50;
    MAIN;
    
    TravelTimeRes(scIndx,6) = TT;
    
    fprintf('* sc#%d-%d with (CAV %3.1f, F %d, DR %d) TT %3.1f sec ended.\n',...
        sc, simCounter, round(r,2), floor(f), floor(dr), round(TT,1));
    
    clearvars -except 'Vissim' 'Name'...
        'sc' 'numSim' 'End_of_simulation' ...
        'SimRes' 'flowVol' 'CAVratio' 'detRange' 'minHW' ...
        'ii' 'simCounter' 'TravelTimeRes'
end

save('resultsN.mat')
%% ========================================================================
% End Vissim
%==========================================================================
Vissim.release
