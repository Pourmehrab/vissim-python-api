%% Open Executive Vissim Server

Vissim = actxserver('Vissim.Vissim-64.900');

vissFolPath = strcat(cd, '\[2].viss-mod'); % VISSIM folder

%% Load a Vissim Network:

Filename                = fullfile(vissFolPath, strcat(Name,'.inpx'));

flag_read_additionally  = false; % you can read network(elements) additionally, in this case set "flag_read_additionally" to true

Vissim.LoadNet(Filename, flag_read_additionally);


%% Load a Layout:

Filename = fullfile(vissFolPath, strcat(Name,'.layx'));

Vissim.LoadLayout(Filename);

if ~vissVis  % to disabla the vissualization in VISSIM and make simulation faster
    
    Vissim.SuspendUpdateGUI; %  stop updating of the complete Vissim workspace (network editor, list, chart and signal time table windows)

end

display('Checked! vissim executed and the network loaded successfully.')