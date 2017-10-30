function [  ] = TrajDiag( vehicles ,signal, phasesLib, CommRange,time,fig,intersectionConfig)
clf(fig)

str = [num2str(time * 1000),' ms','.png'];

signalTicks = time;
for ph = 1:length(signal.nextPhasesSeq)
    if signal.nextPhasesG(ph)~=0
        signalTicks = [signalTicks, signalTicks(end)+signal.nextPhasesG(ph)];
    end
    if signal.nextPhasesY(ph)~=0
        signalTicks = [signalTicks, signalTicks(end)+signal.nextPhasesY(ph)];
    end
    if signal.nextPhasesAR(ph)~=0
        signalTicks = [signalTicks, signalTicks(end)+signal.nextPhasesAR(ph)];
    end
end

maxTime = signalTicks(end)+1;
for lane = 1:intersectionConfig.NoOfLanes
    plot(subplot(2,3,lane),[time time],[0 CommRange],'b','LineWidth',1);
    axis([time maxTime 0 CommRange])
    grid on
    hold on
    DT=gca;
    
    DT.XTick = round(signalTicks,2);
    
    yticks(0:CommRange/10:CommRange)
    yticklabels(strread(num2str(CommRange:-CommRange/10:0),'%s'))
end

updatedTime = time;
for ph = 1:length(signal.nextPhasesSeq)
    updatedTime = updatedTime + signal.nextPhasesG(ph) + signal.nextPhasesY(ph) + signal.nextPhasesAR(ph);
    for lane = 1:intersectionConfig.NoOfLanes
        if ismember(lane,phasesLib(signal.nextPhasesSeq(ph)).Lanes)
            plot(subplot(2,3,lane),[updatedTime-(signal.nextPhasesG(ph) + signal.nextPhasesY(ph)+signal.nextPhasesAR(ph)) , updatedTime-(signal.nextPhasesY(ph)+signal.nextPhasesAR(ph))],[CommRange;CommRange],'g','LineWidth',4,'DisplayName','RED Interval');
            hold on
            plot(subplot(2,3,lane),[updatedTime-(signal.nextPhasesY(ph)+signal.nextPhasesAR(ph)) , updatedTime-signal.nextPhasesY(ph)],[CommRange;CommRange],'y','LineWidth',4,'DisplayName','RED Interval');
            hold on
            plot(subplot(2,3,lane),[updatedTime-signal.nextPhasesAR(ph) , updatedTime],[CommRange;CommRange],'r','LineWidth',4,'DisplayName','RED Interval');
            hold on
        else
            plot(subplot(2,3,lane),[updatedTime-(signal.nextPhasesG(ph) + signal.nextPhasesY(ph)+signal.nextPhasesAR(ph)) , updatedTime],[CommRange;CommRange],'r','LineWidth',4,'DisplayName','RED Interval');
            hold on
        end
        set(gca,'FontName', 'Lato','TickDir','out','XMinorTick','on','YMinorTick','on','box', 'off');
        
        ax=gca;
        ax.XTickLabelRotation=90;
        a = get(gca,'XTickLabel');
        set(gca,'XTickLabel',a,'FontName','Lato','fontsize',7)
        
        xlabel('time (s)');ylabel('distance to the stop bar (ft)');
        title(subplot(2,3,lane),['Incoming Lane ',num2str(lane)])
        %         legend('show');
        
    end
end

for lane = 1:intersectionConfig.NoOfLanes
    if vehicles(lane).vehIndx(1) ~=0
        NoOfVehs       = mod(vehicles(lane).vehIndx(2)-vehicles(lane).vehIndx(1)+1, intersectionConfig.maxNoVehsPerLane);
        vehCounter     = 1; k              = vehicles(lane).vehIndx(1);
        
        while vehCounter <= NoOfVehs
            TPI = vehicles(lane).trajPointIndx(k,:);
            if TPI(2) > TPI(1)
                if vehicles(lane).type(k)==1
                    plot(subplot(2,3,lane),vehicles(lane).trajectory{k}(TPI(1):TPI(2),1),CommRange-vehicles(lane).trajectory{k}(TPI(1):TPI(2),2),'k-','LineWidth',1,'DisplayName','Conventional');
                    %                 axis([phasesLib(currPhase).Green(1) maxTime 0 CommRange])
                    % GridLineStyle = 'Solid'; GridLineWidth = 4; GridLineColor = 'k' ;
                    %                 grid on
                    hold on
                    %                             DT=gca;
                    %                             DT.XTick = vehicles(lane).VehTraj{i}(:,1);
                else
                    plot(subplot(2,3,lane),vehicles(lane).trajectory{k}(TPI(1):TPI(2),1),CommRange-vehicles(lane).trajectory{k}(TPI(1):TPI(2),2),'k--','LineWidth',1,'DisplayName','Conventional');
                    hold on
                end
            else
                index = [TPI(2):intersectionConfig.maxNoTrajPoint,1:TPI(1)];
                if vehicles(lane).type(k)==1
                    plot(subplot(2,3,lane),vehicles(lane).trajectory{k}(index,1),CommRange-vehicles(lane).trajectory{k}(index,2),'k-','LineWidth',1,'DisplayName','Conventional');
                    %                 axis([phasesLib(currPhase).Green(1) maxTime 0 CommRange])
                    % GridLineStyle = 'Solid'; GridLineWidth = 4; GridLineColor = 'k' ;
                    %                 grid on
                    hold on
                    %                             DT=gca;
                    %                             DT.XTick = vehicles(lane).VehTraj{i}(:,1);
                else
                    plot(subplot(2,3,lane),vehicles(lane).trajectory{k}(index,1),CommRange-vehicles(lane).trajectory{k}(index,2),'k--','LineWidth',1,'DisplayName','Conventional');
                    hold on
                end
            end
            k              = 1 + mod(k,intersectionConfig.maxNoVehsPerLane); % GO TO THE NEXT VEHICLE
            vehCounter = vehCounter + 1;
        end
    end
end
set(gcf, 'PaperPositionMode', 'auto');
print(fig,str,'-painters','-dpng','-r600')
% print(fig,str,'-painters','-dpng','-r0')

% close(fig)
end


