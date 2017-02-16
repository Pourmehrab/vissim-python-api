function [FollowerTrajectoryMat] = GippsCarFoll( LeadTime,FollMaxAcc,FollDesiredSpd,...
    FollMaxDecc,LeadDist,FollInitDist,FollInitSpd,LeadVehLength,LeadVehSpd,LeadMaxDecc,simParameters)

t=LeadTime;
d=FollInitDist*ones(size(t));
v=FollInitSpd*ones(size(t));
minSpaceHeadway=LeadVehLength/2;

dt=diff(t);

for i=1:length(dt)
    if d(i)>LeadDist(i)+minSpaceHeadway
        sqrt1=(0.025+v(i)/FollDesiredSpd);
        sqrt2=(FollMaxDecc*dt(i))^2-FollMaxDecc*(2*(-LeadDist(i)-LeadVehLength+d(i))-v(i)*dt(i)-LeadVehSpd(i)^2/LeadMaxDecc);
        
        if sqrt1>=0 && sqrt2>=0
            v(i+1)=min(v(i)+2.5*FollMaxAcc*dt(i)*(1-v(i)/FollDesiredSpd)*sqrt(sqrt1),FollMaxDecc*dt(i)+sqrt(sqrt2));
            a=(v(i+1)-v(i))/dt(i);
            d(i+1)=d(i)-(a*(t(i+1)^2-t(i)^2)/2+(v(i)-a*t(i))*dt(i));
        elseif sqrt1<0 && sqrt2>=0
            v(i+1)=FollMaxDecc*dt(i)+sqrt(sqrt2);
            a=(v(i+1)-v(i))/dt(i);
            d(i+1)=d(i)-(a*(t(i+1)^2-t(i)^2)/2+(v(i)-a*t(i))*dt(i));
        elseif sqrt1>=0 && sqrt2<0
            v(i+1)=v(i)+2.5*FollMaxAcc*dt(i)*(1-v(i)/FollDesiredSpd)*sqrt(sqrt1);
            a=(v(i+1)-v(i))/dt(i);
            d(i+1)=d(i)-(a*(t(i+1)^2-t(i)^2)/2+(v(i)-a*t(i))*dt(i));
        else
            d(i+1)=LeadDist(i)+LeadVehLength;
            v(i+1)=(d(i)-d(i+1))/dt(i);
        end
        if d(i+1)<LeadDist(i)+LeadVehLength
            d(i+1)=LeadDist(i)+LeadVehLength;
            v(i+1)=(d(i)-d(i+1))/dt(i);
%             fprintf('Follower is so close at speed %.2f ft/s (lead %.2f ft/s)\n',v(i),LeadVehSpd(i))
        end
    else
        v(i+1)=0 ;
        d(i+1)=d(i) ;
    end
    
end


FollowerTrajectoryMat=[round(t,simParameters.timeDecimals),round(d,simParameters.distanceDecimals)];


end

