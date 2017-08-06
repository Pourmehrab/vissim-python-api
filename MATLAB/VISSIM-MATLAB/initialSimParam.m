%% Modify the Simulation Parameters

% Chose Random Seed
set(Vissim.Simulation, 'AttValue', 'RandSeed', sc);

% Set a signal controller program:
SC_number = 1; % SC = SignalController
SignalController = Vissim.Net.SignalControllers.ItemByKey(SC_number);
new_signal_programm_number = 1;
set(SignalController, 'AttValue', 'ProgNo', new_signal_programm_number);

% Or run the simulation continuous (it stops at breakpoint or end of simulation)
set(Vissim.Simulation, 'AttValue', 'SimPeriod', End_of_simulation);
% Set maximum speed:
set(Vissim.Simulation, 'AttValue', 'UseMaxSimSpeed', true);
% Hint: to change the speed use: set(Vissim.Simulation, 'AttValue', 'SimSpeed', 10); % 10 => 10 Sim. sec. / s
% set simulation resolution to a small number to have nice and smooth
% signal swithes
set(Vissim.Simulation, 'AttValue', 'SimRes', SimRes);

% COMMENT OUT IF ANIMATION IS REQUIRED
% set(Vissim.Graphics.CurrentNetworkWindow, 'AttValue', 'QuickMode', 1);
% Vissim.SuspendUpdateGUI; %  stop updating of the complete Vissim workspace (network editor, list, chart and signal time table windows)

% Extract link lenghts from Vissim model
VissimData.OptRange = zeros(intersectionConfig.NoOfLinks,1);
VissimData.LinkLength = zeros(intersectionConfig.NoOfLinks,1);

map = [1,2,2,3,4,5,6,7,8,9,9,10,11,11,12,12];
Vissim.Net.DataCollectionPoints.SetAllAttValues('Pos',0);
for link = 1:intersectionConfig.NoOfLinks
    linkLength = get(Vissim.Net.Links.ItemByKey(link),'AttValue','length2D');
    VissimData.OptRange(link) = linkLength - dr ;
    
    %     YOU NEED LANE NO, NOT LINK NO FOR THIS
    %     set(Vissim.Net.DataCollectionPoints.ItemByKey(lane), 'AttValue', 'Pos',VissimData.OptRange(lane));
    
    VissimData.LinkLength(link) = linkLength;
    set(Vissim.Net.VehicleTravelTimeMeasurements.ItemByKey( link ),'AttValue','StartPos',VissimData.OptRange(link));
    set(Vissim.Net.VehicleTravelTimeMeasurements.ItemByKey( link ),'AttValue','EndPos',linkLength);
end

