clc
clear all;




%% ========================================================================
% Vehicle Interface
%==========================================================================

All_Vehicles    = Vissim.Net.Vehicles.GetAll; % get all vehicles in the network at the actual simulation second
Vehicle         = All_Vehicles{1};

get(All_Vehicles{1},'AttValue','VehType')

set(All_Vehicles{1}, 'AttValue', 'ExtContr ', 4);
moveVeh2Pos(All_Vehicles{1}, 0, 15)


Vissim.Simulation.SimulationSecond
get(All_Vehicles{1},'AttValue','No');

All_Vehicles{1}.NextLink
% Set desired speed to a vehicle:
new_desspeed = 30;
set(Vehicle, 'AttValue', 'DesSpeed', new_desspeed);


Vissim.Simulation.RunSingleStep;

display('done.')



%% ========================================================================
% End Vissim
%==========================================================================
Vissim.release
