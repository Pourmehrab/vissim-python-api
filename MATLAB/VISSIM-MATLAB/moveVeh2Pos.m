function [ output_args ] = moveVeh2Pos( Vehicle, speed, link_coordinate )
%MOVEVEH2POS Summary of this function goes here
%   Detailed explanation goes here

% Jochen Lohmiller Hi Mahmoud,
% if you change the vehicles attribute ExtContr to EVC_COM (ExtContr 
% = 4; set(IVehicle, 'AttValue', 'ExtContr ', 4) ), PTV Vissim will not take
% control of this vehicle when calculating a new time step (no braking for 
%     red signals, other vehicles, no lane change, ...). Instead, it will 
%     continue driving with its current speed. So, if you don't want to move 
%     the vehicle at all, change the vehicles attributes ExtContr to EVC_COM 
%     and Speed to zero.
% Of course, using External Driver Behavior you can also achieve this behavior.
% Kind Regards, 
% Jochen


link_number = get(Vehicle.Lane,'AttValue','Link');
lane_number = get(Vehicle,'AttValue','Lane');
% get link, lane, distance, type, speed for an specific ID: here 'No'
% get(All_Vehicles{1},'AttValue','Pos');
% get(All_Vehicles{1},'AttValue','Speed');

set(Vehicle, 'AttValue', 'Speed', 0);


% Move a vehicle:
Vehicle.MoveToLinkPosition(link_number, lane_number, link_coordinate); % This function will operate during the next simulation step

% Hint: In earlier Vissim releases, the name of the function was: MoveToLinkCoordinate



end

