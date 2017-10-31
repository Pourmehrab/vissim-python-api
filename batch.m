%% Written By: Mahmoud Pouremhrab
% Email: mpourmehrab@ufl.edu

clc;
clear;
close('all');
fclose('all');

%% Import necessary folders

addpath('[0].inputs','[1].bin','[2].viss-mod','[3].outputs','[4].trj-opt',...
    '[5].vismat','[6].viss-mod-semi')

%% User Inputs

Name = '13thAND16th';
vissVis = 0;

%% Import Mat files

load(strcat(Name,'Config'));

chkInputs;
initInputs;
%% Main batch loop
try
    
    initViss;
    
    for  scIndx = 1:simNum
        
        % Load Matlab Config file
        load(strcat(Name,'Config'));
        
        %% ============================================================
        % Network Configuration
        %==============================================================
        sc          =       TT(scIndx,1); % used as random seed
        r  =  TT(scIndx,3);
        f  =  TT(scIndx,4);
        dr =  TT(scIndx,5);
        adjustNetwork;
        
        initialSimParam;
        
        %% ============================================================
        % Run Simulation
        %==============================================================
        TT      =   0;
        Nserved =   0;
        %                 dr      =   722; f = 50;
        MAIN;
        
        TT(scIndx,6) = TT;
        
        fprintf('* sc#%d-%d with (CAV %3.1f, F %d, DR %d) TT %3.1f sec ended.\n',...
            sc, simCounter, round(r,2), floor(f), floor(dr), round(TT,1));
        
        clearvars -except 'Vissim' 'Name'...
            'sc' 'numSim' 'End_of_simulation' ...
            'SimRes' 'flowVol' 'CAVratio' 'detRange' 'minHW' ...
            'ii' 'simCounter' 'TT'
    end
catch
    display('Something went wrong!')
    Vissim.release
end
save('resultsN.mat')
