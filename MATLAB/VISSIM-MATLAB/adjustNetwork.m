%% Modify the Network

% 1 SB; 2 EB; 3 NB; 4 WB
% 1 right turn; 2 through; 3 left turn

% Set Flow (Unit?):
Vissim.Net.VehicleInputs.SetAllAttValues('Volume(1)',f)

% Set vehicle composition:
Veh_composition_number = 1;
Rel_Flows = Vissim.Net.VehicleCompositions.ItemByKey(Veh_composition_number).VehCompRelFlows.GetAll;
set(Rel_Flows{1}, 'AttValue', 'VehType',        100); % Changing the vehicle type
set(Rel_Flows{1}, 'AttValue', 'DesSpeedDistr',   50); % Changing the desired speed distribution 
% 50.0 kph is 45.6 fts or 31.1 mph
set(Rel_Flows{1}, 'AttValue', 'RelFlow',        1-r); % Changing the relative flow

set(Rel_Flows{2}, 'AttValue', 'VehType',        610); % Changing the vehicle type
set(Rel_Flows{2}, 'AttValue', 'DesSpeedDistr',   50); % Changing the desired speed distribution 
% 50.0 kph is 45.6 fts or 31.1 mph
set(Rel_Flows{2}, 'AttValue', 'RelFlow',          r); % Changing the relative flow of the 2nd Relative Flow.



%% ========================================================================
% Saving
%==========================================================================
Filename = fullfile(Path_of_VISSIM_files, strcat(Name,'.inpx'));
Vissim.SaveNetAs(Filename)
Filename = fullfile(Path_of_VISSIM_files, strcat(Name,'.layx'));
Vissim.SaveLayout(Filename)
