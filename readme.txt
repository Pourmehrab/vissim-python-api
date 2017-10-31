filename: keep it the same for matfiles insice [0] and the vissim model in [2].
input folder has mat file by the namae of  Name + 'Config'

simParameters.simDur is in seconds and includes warm-up period
simParameters.simNum should be confirmed by the sample size rule
simParameters.simRes is number of steps per second % the inverse of this should not exceed trajectory resolution


hardcode minG, MaxG, and the unmber of lanes in a phase inside initInput.m @ 0


% negative one means the simulation of this has been fails
output data: TT = [TT;[simCounter r f dr -1]];

