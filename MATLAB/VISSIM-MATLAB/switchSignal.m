function [  ] = switchSignal( Vissim, SC_number, greenSGs )
%% modify signal

% Set the state of a signal controller:
% Note: Once a state of a signal group is set, the attribute "ContrByCOM" is automatically set to True. Meaning the signal group will keep this state until another state is set by COM or the end of the simulation
% To switch back to the defined signal controller, set the attribute signal "ContrByCOM" to False (example see below).

SignalController = Vissim.Net.SignalControllers.ItemByKey(SC_number);
% SG_count = SignalController.SGs.Count;

for SG_number = greenSGs; % SG = SignalGroup
    SignalGroup = SignalController.SGs.ItemByKey(SG_number);
    new_state = 'GREEN'; %possible values e.g. 'GREEN', 'RED', 'AMBER', 'REDAMBER'
    set(SignalGroup, 'AttValue', 'SigState', new_state);
end

end

