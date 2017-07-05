%% Modify the Network

% 1 SB; 2 EB; 3 NB; 4 WB
% 1 right turn; 2 through; 3 left turn

% Set Flow (Unit?):
Vissim.Net.VehicleInputs.SetAllAttValues('Volume(1)',f)



%% ========================================================================
% Saving
%==========================================================================
Filename = fullfile(Path_of_VISSIM_files, strcat(Name,'.inpx'));
Vissim.SaveNetAs(Filename)
Filename = fullfile(Path_of_VISSIM_files, strcat(Name,'.layx'));
Vissim.SaveLayout(Filename)
