function [ t1, t2, t3, V2, a1, a3, T, feas ] = NonlinLTOsolver(  d0 , V0 , VcrMax , Vmax , maxDecc , maxAcc , G, simParameters  )
% Lead vehicle Trajectory Optimization solver
% By: Mahmoud Pourmehrab

% some pre-processing to detect infeasiblity
if V0 > VcrMax
    VcrVeh = VcrMax;
else
    VcrVehCan = sqrt(V0^2 + 2 * maxAcc * d0);
    VcrVeh = VcrVehCan:(V0-VcrVehCan)/10:V0;
end

%% WHEN T >= G(1)
for V3 = VcrVeh
    minFreeT = 2 * G(2);
    flag     = 0;
    % case 1:     V3 <= Vmax <= V0
    % V2    a1    a3    T
    % Vmax  -     -     >G(1)
    a1 = maxDecc; a3 = maxDecc;
    if Vmax <= V0 && Vmax >= V3 % V2 = Vmax AND V0 >= V3
        V2 = Vmax;
        t1      =   round((V2 - V0) / a1    , simParameters.timeDecimals);
        t2      =   round((d0 - (V2^2 - V0^2)/(2 * a1) - (V3^2 - V2^2)/(2 * a3))/V2,simParameters.timeDecimals);
        t3      =   round((V3 - V2) / a3, simParameters.timeDecimals);
        if t2 >= 0 % A FEASIBLE SOL REGARDLESS OF IMPLICIT CONSTRAINT IS ACHIEVED
            T = t1 + t2 + t3;
            if minFreeT > T
                minFreeT = T;
                flag     = 1;
            end
            if T >= G(1) && T <= G(2) % IMPLICITLY CHECK THE ASSUMPTION ON TRAVEL TIME
                feas = 1;     % SERVED
                return; % ALL SEEM GOOD
            end
        end
    end
    
    % case 2:     V0 <= Vmax <= V3
    % V2    a1    a3    T
    % Vmax  +     +     >G(1)
    if V0 <= Vmax && Vmax <= V3 % TO MAKE ACC POSSIBLE
        a1 = maxAcc;a3 = maxAcc;
        V2      =   Vmax;
        t1      =   round((V2 - V0) / a1    , simParameters.timeDecimals);
        t2      =   round((d0 - (V2^2 - V0^2)/(2 * a1) - (V3^2 - V2^2)/(2 * a3))/V2,simParameters.timeDecimals);
        t3      =   round((V3 - V2) / a3, simParameters.timeDecimals);
        if t2 >= 0 % A FEASIBLE SOL REGARDLESS OF IMPLICIT CONSTRAINT IS ACHIEVED
            T = t1 + t2 + t3;
            if minFreeT > T
                minFreeT = T;
                flag     = 1;
            end
            if T >= G(1) && T <= G(2) % IMPLICITLY CHECK THE ASSUMPTION ON TRAVEL TIME
                feas = 1;     % SERVED
                return; % ALL SEEM GOOD
            end
        end
    end
    
    % case 3:     V0 <= Vmax <= V3
    % V2    a1    a3    T
    % ?     +     -     >G(1)
    if V0 <= Vmax  % TO MAKE ACC POSSIBLE
        a1  = maxAcc; a3 = maxDecc;
        V2squared = (a1 * V3^2 - 2 * a1 * a3 * d0 - a3 * V0^2)/(a1 - a3); % ASSUMING T > G(1)
        if V2squared > 0
            V2  =  min(round(sqrt(V2squared),simParameters.speedDecimals),Vmax); % CONSIDER SPEED LIMIT
            if V2 >= V0 && V2 >= V3 % CHECK THE ASSUMPTION MADE WHEN V2 WAS NOT KNOWN
                t1      =   round((V2 - V0) / a1,simParameters.timeDecimals);
                t2      =   round((d0 - (V2^2 - V0^2)/(2 * a1) - (V3^2 - V2^2)/(2 * a3))/V2,simParameters.timeDecimals);
                t3      =   round((V3 - V2) / a3,simParameters.timeDecimals);
                if t2 >= 0 % A FEASIBLE SOL REGARDLESS OF IMPLICIT CONSTRAINT IS ACHIEVED
                    T = t1 + t2 + t3;
                    if minFreeT > T
                        minFreeT = T;
                        flag     = 1;
                    end
                    if T >= G(1) && T <= G(2) % IMPLICITLY CHECK THE ASSUMPTION ON TRAVEL TIME
                        feas = 1;     % SERVED
                        return; % ALL SEEM GOOD
                    end
                end
            end
        end
    end
    
    % case 4:     V0 <= Vmax <= V3
    % V2    a1    a3    T
    % ?     -     +     >G(1)
    a1 = maxDecc;a3 = maxAcc;
    V2squared    =    (a1 * V3^2 - 2 * a1 * a3 * d0 - a3 * V0^2)/(a1 - a3);
    if V2squared > 0
        V2 = min(round(sqrt(V2squared),simParameters.speedDecimals),Vmax);
        if V2 <= V0 && V2 <= V3 % CHECK THE ASSUMPTION MADE WHEN V2 WAS NOT KNOWN
            t1      =   round((V2 - V0) / a1,simParameters.timeDecimals);
            t2      =   round((d0 - (V2^2 - V0^2)/(2 * a1) - (V3^2 - V2^2)/(2 * a3))/V2,simParameters.timeDecimals);
            t3      =   round((V3 - V2) / a3,simParameters.timeDecimals);
            T = t1 + t2 + t3;
            if t2 >= 0 % A FEASIBLE SOL REGARDLESS OF IMPLICIT CONSTRAINT IS ACHIEVED
                T = t1 + t2 + t3;
                if minFreeT > T
                    minFreeT = T;
                    flag     = 1;
                end
                if T >= G(1) && T <= G(2) % IMPLICITLY CHECK THE ASSUMPTION ON TRAVEL TIME
                    feas = 1;     % SERVED
                    return; % ALL SEEM GOOD
                end
            end
        end
    end
    
    %% WHEN T > G(1) COULD NOT BE ACHIEVED. SEARCH AMONG CASES WHICH T = G(1)
    
    if flag == 0 || minFreeT <= G(2)
        % case 5:     V0, V3 <= V2
        % V2    a1    a3    T
        % ?     +     -     =G(1)
        a1 = maxAcc; a3 = maxDecc;
        V2squared = a1 * a3 * (a1 * (G(1) * (a3 * G(1)-2 * V3)+2 * d0)-2 * a3 * (d0-G(1) * V0)+(V0-V3)^2);
        if V2squared >= 0
            V2 = round((-sqrt(V2squared)-a3 * (a1 * G(1) + V0) + a1 * V3)/(a1-a3),simParameters.speedDecimals);
            if V2 < 0 || ~isreal(V2)
                V2  = round((sqrt(V2squared)-a3 * (a1 * G(1) + V0) + a1 * V3)/(a1-a3),simParameters.speedDecimals);
            end
            if V2>=V0 && V2>=V3 && isreal(V2) % CHECK THE ASSUMPTION MADE WHEN V2 WAS NOT KNOWN
                t1      =   round((V2 - V0) / a1,simParameters.timeDecimals);
                t2      =   round((d0 - (V2^2 - V0^2)/(2 * a1) - (V3^2 - V2^2)/(2 * a3))/V2,simParameters.timeDecimals);
                t3      =   round((V3 - V2) / a3,simParameters.timeDecimals);
                T       =   t1 + t2 + t3;
                feas    =   1;     % SERVED
                if t2 >=0
                    return; % ALL SEEM GOOD
                end
            else
                % case 6:     V2 <= V0, V3
                % V2    a1    a3    T
                % ?     -     +     =G(1)
                a1 = maxDecc;a3 = maxAcc;
                V2squared = a1 * a3 * (a1 * (G(1) * (a3 * G(1)-2 * V3)+2 * d0)-2 * a3 * (d0-G(1) * V0)+(V0-V3)^2);
                V2 = round((-sqrt(V2squared)-a3 * (a1 * G(1) + V0) + a1 * V3)/(a1-a3),simParameters.speedDecimals);
                if V2 < 0 || ~isreal(V2)
                    V2  = round((sqrt(V2squared)-a3 * (a1 * G(1) + V0) + a1 * V3)/(a1-a3),simParameters.speedDecimals);
                end
                if V2 <= V0 && V2 <= V3 && isreal(V2)
                    t1      =   round((V2 - V0) / a1,simParameters.timeDecimals);
                    t2      =   round((d0 - (V2^2 - V0^2)/(2 * a1) - (V3^2 - V2^2)/(2 * a3))/V2,simParameters.timeDecimals);
                    t3      =   round((V3 - V2) / a3,simParameters.timeDecimals);
                    T       =   t1 + t2 + t3;
                    feas    =   1;     % SERVED
                    if t2 >=0
                        return; % ALL SEEM GOOD
                    end
                end
            end
        end
        % case 7:     V0 <= V2 <= V3
        % V2    a1    a3    T
        % ?     +     +     =G(1)
        a1 = maxAcc;
        V2 = round(( a1 * d0 + (V0^2 - V3^2)/2)/( a1 * G(1) +  V0 -  V3),simParameters.speedDecimals);
        if V2 >= V0 && V2 <= V3
            a3      =   maxAcc;
            t1      =   round((V2 - V0) / a1,simParameters.timeDecimals);
            t2      =   round((d0 - (V2^2 - V0^2)/(2 * a1) - (V3^2 - V2^2)/(2 * a3))/V2,simParameters.timeDecimals);
            t3      =   round((V3 - V2) / a3,simParameters.timeDecimals);
            T       =   t1 + t2 + t3;
            feas    =   1;     % SERVED
            if t2 >=0
                return; % ALL SEEM GOOD
            end
        end
        % case 8:     V3 <= V2 <= V0
        % V2    a1    a3    T
        % ?     -     -     =G(1)
        a1 = maxDecc;
        V2 = round(( a1 * d0 + (V0^2 - V3^2)/2)/( a1 * G(1) +  V0 -  V3),simParameters.speedDecimals);
        if V2 <= V0 && V2 >= V3
            a3  =     maxDecc;
            t1  =     round((V2-V0)/a1,simParameters.timeDecimals);
            t2  =     round((d0 - (V2^2 - V0^2)/(2 * a1) - (V3^2 - V2^2)/(2 * a3))/V2,simParameters.timeDecimals);
            t3  =     round((V3-V2)/a3,simParameters.timeDecimals);
            T   =     t1 + t2 + t3;
            feas = 1;     % SERVED
            if t2 >=0
                return; % ALL SEEM GOOD
            end
        end
    else % min unrestricted travel time is higher than G(2)
        continue
    end
end
% display('The problem is infeasible')
V2 = V0;
a3 = 0; t3=0;
t1 = 0;
a1 = 0;
t2 = max(G(1),d0/V0);
T  = t2;
feas = 0;

end