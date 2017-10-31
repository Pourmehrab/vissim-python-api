
%% initializing the result matrix

TT = []; % keeps the travel times

for  f = flowVol
    for r = CAVratio
        for dr = detRange
            for simCounter = 1:simParameters.simRep
                % negative one means the simulation of this has been fails
                TT = [TT;[simCounter r f dr -1]];
            end
        end
    end
end

simNum = size(TT,1); % total number of simulations considering all scenarios and repeatisions

%% phase enumeration
% we assume all phases have the same min max green hardcoded bellow

%     for counter in range(0, len(movements) + 1):
%         for subset in itertools.combinations(movements, counter):
%             if lane_conflict_mat[[subset]][:, [subset]].sum() == 0 and len(
%                     subset) == 4:  # four is for this special layout
%                 phase_lib.append({'lane': subset, 'min_g': min_g, 'max_g': max_g})
% 
%     phase_count = len(phase_lib)
% 
%     phase_move_incid = np.zeros((phase_count, lane_conflict_mat.shape[1]), dtype=int)
% 
%     for counter in range(0, phase_count):
%         phase_move_incid[counter, phase_lib[counter]['lane']] = 1
% 
%     return phase_count, phase_lib, phase_move_incid

allComb = combnk(1:intersectionConfig.NoOfLanes , 4);

