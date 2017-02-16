clc
clear
close all
simParameters           =   struct('trajTimePrecision',1,'globalTime',0,'timeDecimals',3,...
    'distanceDecimals',2,'speedDecimals',2,...
    'refFullTime',datetime(datevec(datetime('now'))-[0 0 0 0 0 4]));

V0=34*5280/3600;
Vf=40*5280/3600;
d0=1000;
amin= -5; amax= 3;
Vmax= 40*5280/3600;
G=0;

dt = 0.2;


% fig=figure('Name','Trajectories per Lanes','NumberTitle','off',...
%     'units','normalized','outerposition',[0 0 1 1],'Color','w');
% grid on
t0=0;
% for G=60:-1:5
[ t1,t2,t3,Vm,a1,a3,T ] = TrajOptExt(  d0 , V0 , Vf , Vmax , amin , amax , G, simParameters  );

dt1=0:dt:t1;
if dt1(end)~=t1
    dt1=[dt1,t1];
end
S1=d0-(a1*dt1.^2/2+V0*dt1);
%     plot(dt1,d0-S1,'Color',[255,69,0]/255,'LineWidth',2);hold on
% scatter([dt1,t1+dt2,t1+t2+dt3],d0-[S1,S2,S3],'filled','k');
fprintf('%d+(%d/2*(x-%f)^2+%f(x-%f)) (%f,%f)\n',-d0,a1,t0,V0,t0,t0,t0+t1);

dt2=0:dt:t2;
if dt2(end)~=t2
    dt2=[dt2,t2];
end
S2=d0-(a1*t1.^2/2+V0*t1)-(Vm*dt2);
%     plot(t1+dt2,d0-S2,'Color',[255,215,0]/255,'LineWidth',2);hold on
fprintf('%f+%f(x-%f) (%f,%f)\n',-S2(1),Vm,t0+t1,t0+t1,t0+t1+t2);

dt3=0:dt:t3;
if dt3(end)~=t3
    dt3=[dt3,t3];
end
S3=d0-(a1*t1.^2/2+V0*t1)-(Vm*t2)-(a3*dt3.^2/2+Vm*dt3);
%     plot(t1+t2+dt3,d0-S3,'Color',[154,205,50]/255,'LineWidth',2);hold on
fprintf('%f+(%d/2*(x-%f)^2+%f(x-%f)) (%f,%f)\n',-S3(1),a3,t0+t1+t2,Vm,t0+t1+t2,t0+t1+t2,t0+t1+t2+t3);

%         grid
%     DT=gca;
%     DT.XTick = round([t1,t1+t2,t1+t2+t3,],1);
%     DT.YTick = round(d0-[S1(end),S2(end),0],1);
% end

xlabel('Time (s)');ylabel('Distance travelled from d_{Comm} (ft)');

set(gcf, 'PaperPositionMode', 'auto');
set(gca,'FontName', 'Lato','FontSize',20,'box', 'off'...
    ,'LineWidth',.5,'GridAlpha',.8);
title('Trajectory Graph') % ,' (N 1, E 2,S 3,W 4)'

print(fig,'figure','-painters','-dpng','-r600')
clf(fig);
close all;

