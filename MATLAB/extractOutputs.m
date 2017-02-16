clc
clear
close('all');
fclose('all');
% uisetfont



%% INITIALIZE PARAMETERS

sc                          =           581;

load (['scenario',num2str(sc),'_output.mat'])
maxFreq    =      40;
minTP      =      0;
maxTP      =      0;
percentile =      85;

TTFile = fopen(['scenario',num2str(sc),'_TT.bin'],'r');    Throughput=fread(TTFile,'int')/1000;fclose(TTFile);
ARFile = fopen(['scenario',num2str(sc),'_AR.bin'],'r');    Arrival=fread(ARFile,'int')/1000;fclose(ARFile);
SCFile = fopen(['scenario',num2str(sc),'_SC.bin'],'r');    signalRecord=fread(SCFile,'int')/1000;fclose(SCFile);

Throughput = transpose(reshape(Throughput,[6 length(Throughput)/6]));
Arrival = transpose(reshape(Arrival,[3 length(Arrival)/3]));
signalRecord = transpose(reshape(signalRecord,[5 length(signalRecord)/5]));

ii = 2;
sigGTick = [0 0];
sigYTick = [0 0];
sigRTick = [0 0];
sigPhTick = [0];
while ii <= size(signalRecord,1)
    if signalRecord(ii,2) == signalRecord(ii-1,2)
        signalRecord(ii-1,:) = [];
    else
        sigGTick = [sigGTick; signalRecord(ii-1,1)+[0 signalRecord(ii-1,3)]];
        sigYTick = [sigYTick; sigGTick(end,2)+[0 signalRecord(ii-1,4)]];
        sigRTick = [sigRTick; sigYTick(end,2)+[0 signalRecord(ii-1,5)]];
        sigPhTick= [sigPhTick; [sigGTick(ii-1,1); sigYTick(ii-1,2)]];
        ii = ii + 1;
    end
end
sigGTick = [sigGTick; sigRTick(end,2)+[0 signalRecord(ii-1,3)]];
sigYTick = [sigYTick; sigGTick(end,2)+[0 signalRecord(ii-1,4)]];
sigRTick = [sigRTick; sigYTick(end,2)+[0 signalRecord(ii-1,5)]];
sigPhTick= [sigPhTick; [sigGTick(ii-1,1); sigYTick(ii-1,2)]];

sigGTick(1,:)=[];sigYTick(1,:)=[];sigRTick(1,:)=[];sigPhTick(1:3)=[];

for lane = 1:intersectionConfig.NoOfLanes
    index = Throughput(:,1) == lane;
    if sum(index) > maxTP
        maxTP = sum(index);
    end
end
%% THROUGHPUT FOR A SMALL INTERVAL

THfig = figure('Name','THROUGHPUT FOR A SPECIFIC INTERVAL','NumberTitle','off','units','normalized','outerposition',[0 0 1 1],'Color','w');
hold on

convertedTHmatrix = zeros(1,intersectionConfig.NoOfLanes+1);% time, lanes' throughputs
for ii = 1:size(Throughput,1)
    addRow = convertedTHmatrix(end,:);
    addRow(1) = Throughput(ii,3);
    addRow(Throughput(ii,1)+1) = addRow(Throughput(ii,1)+1) + 1;
   convertedTHmatrix = [convertedTHmatrix;addRow];
end
convertedARmatrix = zeros(1,intersectionConfig.NoOfLanes+1);% time, lanes' throughputs
for ii = 1:size(Arrival,1)
    addRow = convertedARmatrix(end,:);
    addRow(1) = Arrival(ii,2);
    addRow(Arrival(ii,1)+1) = addRow(Arrival(ii,1)+1) + 1;
    convertedARmatrix = [convertedARmatrix;addRow];
end

intStart = 60;
intEnd = 180;
indexTH = convertedTHmatrix(:,1)>=intStart & convertedTHmatrix(:,1)<=intEnd;
indexAR = convertedARmatrix(:,1)>=intStart & convertedARmatrix(:,1)<=intEnd;
indexSC = sigGTick(:,1)>=intStart & sigYTick(:,2)<=intEnd;
truncatedSig= [sigGTick(indexSC,1),sigYTick(indexSC,2),signalRecord(indexSC,2)];
maxTH=0;minTH = 10e10;
for lane = 1:intersectionConfig.NoOfLanes
    index = convertedTHmatrix(indexTH,lane+1);
    if minTH>index(1)
        minTH = index(1);
    end
    if maxTH<index(end)
        maxTH = index(end);
    end
end

for lane = 1:intersectionConfig.NoOfLanes
    subplot(2,3,lane) % CHANGE FOR DIFFERENT SITUATION
    
    THplot =  stairs(convertedTHmatrix(indexTH,1),convertedTHmatrix(indexTH,lane+1),'r','LineWidth',1.75);
    hold on
    subplot(2,3,lane)
    THplot =  stairs(convertedARmatrix(indexAR,1),convertedARmatrix(indexAR,lane+1),'k','LineWidth',1.75);
    hold on
    throPlot=gca;
    % perfMeasure.signalRecord(1,::2)=perfMeasure.signalRecord(1,::2)+2*timeStep;
    throPlot.XTick = reshape(truncatedSig(:,1:2)',size(truncatedSig(:,1:2),1)*size(truncatedSig(:,1:2),2),1);
    throPlot.XGrid='on';
    axis([intStart intEnd 0 maxTH])
    set(THplot,'LineWidth',1.5);

    set(gca,'FontName', 'Lato','TickDir','out','YMinorTick','on','box', 'off');

    ax=gca;
    ax.XTickLabelRotation = 90;
    a = get(gca,'XTickLabel');
    set(gca,'XTickLabel',a,'FontName','Lato','fontsize',8)

    hTitle=title(subplot(2,3,lane),['Lane ',num2str(lane)]); % ,' (N 1, E 2,S 3,W 4)'

    hXLabel=xlabel('time (s)');hYLabel=ylabel('Throughput (veh)');
    legend({'Departure','Arrival'});
    l = legend('show');
    l.Box='off';l.Location='northwest';


    set([hTitle, hXLabel, hYLabel], ...
        'FontName'   , 'Lato');
    % set([hLegend, gca]             , ...
    %     'FontSize'   , 8           );
    set(gca,'xticklabel',[])
    set(hYLabel  , ...
        'FontSize'   , 10          );
    set( hTitle                    , ...
        'FontSize'   , 12          , ...
        'FontWeight' , 'bold'      );
    for i=1:size(truncatedSig,1)
        txt1 = ['p',num2str(truncatedSig(i,3))];
        t=text((truncatedSig(i,1)+truncatedSig(i,2))/2,1,txt1,'HorizontalAlignment','center');
        t.FontSize;
        t.FontSize = 8;
    end

end

set(gcf, 'PaperPositionMode', 'auto');
str = ['sc_throughputForSmallInt_',num2str(sc),'.png'];
% print (str,'-painters', '-dpng', '-r600');
close('all');

%% THROUGHPUT FOR WHOLE

THfig = figure('Name','THROUGHPUT FOR THE ENTIRE SIMULATION PERIOD','NumberTitle','off','units','normalized','outerposition',[0 0 1 1],'Color','w');
hold on

for lane = 1:intersectionConfig.NoOfLanes
    subplot(2,3,lane) % CHANGE FOR DIFFERENT SITUATION
    
    THplot =  stairs(convertedTHmatrix(:,1),convertedTHmatrix(:,lane+1),'r','LineWidth',1.25);
    hold on
    subplot(2,3,lane)
    THplot =  stairs(convertedARmatrix(:,1),convertedARmatrix(:,lane+1),'k','LineWidth',1.25);
    hold on
    throPlot=gca;
    % perfMeasure.signalRecord(1,::2)=perfMeasure.signalRecord(1,::2)+2*timeStep;
    throPlot.XGrid='on';
    axis([0 max(convertedTHmatrix(:,1)) 0 max(convertedTHmatrix(end,2:intersectionConfig.NoOfLanes+1))])
    set(THplot,'LineWidth',1.5);

    set(gca,'FontName', 'Lato','TickDir','out','YMinorTick','on','box', 'off');

    ax=gca;
    ax.XTickLabelRotation = 90;
    a = get(gca,'XTickLabel');
    set(gca,'XTickLabel',a,'FontName','Lato','fontsize',8)

    hTitle=title(subplot(2,3,lane),['Lane ',num2str(lane)]); % ,' (N 1, E 2,S 3,W 4)'

    hXLabel=xlabel('time (s)');hYLabel=ylabel('Throughput (veh)');
    legend({'Departure','Arrival'});
    l = legend('show');
    l.Box='off';l.Location='northwest';


    set([hTitle, hXLabel, hYLabel], ...
        'FontName'   , 'Lato');
    % set([hLegend, gca]             , ...
    %     'FontSize'   , 8           );
    set(hYLabel  , ...
        'FontSize'   , 10          );
    set( hTitle                    , ...
        'FontSize'   , 12          , ...
        'FontWeight' , 'bold'      );
%     for i=1:size(truncatedSig,1)
%         txt1 = ['p',num2str(truncatedSig(i,3))];
%         t=text((truncatedSig(i,1)+truncatedSig(i,2))/2,1,txt1,'HorizontalAlignment','center');
%         t.FontSize;
%         t.FontSize = 8;
%     end

end

set(gcf, 'PaperPositionMode', 'auto');
str = ['sc_throughput_',num2str(sc),'.png'];
% print (str,'-painters', '-dpng', '-r600');
close('all');

%% TRAVEL TIME

TTfig = figure('Name','TRAVEL TIME','NumberTitle','off','units','normalized','outerposition',[0 0 1 1],'Color','w');
hold on
xbin = min(Throughput(:,3)-Throughput(:,2)):(max(Throughput(:,3)-Throughput(:,2))-min(Throughput(:,3)-Throughput(:,2)))/10:max(Throughput(:,3)-Throughput(:,2));
for lane=1:intersectionConfig.NoOfLanes
    subplot(2,3,lane)
    index = Throughput(:,1) == lane;
    TT = Throughput(index,3)-Throughput(index,2);
    histTT = histogram(TT,xbin);
    set(histTT,'FaceColor',[255,215,0]/255,'EdgeColor','w');
    
    txt1 =   ['Max : ',num2str(round(max(TT),1)),' sec'];
    txt2 =   ['Min : ',num2str(round(min(TT),1)),' sec'];
    txt3 =   ['Average : ',num2str(round(mean(TT),1)),' sec/veh'];
    txt4 =   ['Standard deviation : ',num2str(round(std(TT),1)),' sec/veh'];
    txt5 =   [[num2str(percentile),'th percentile : '],num2str(round(prctile(TT,percentile),1)),' sec'];
    
    y=[92.5 90 87.5 85 82.5]-60;
    x = 35;
    t=text(x,y(1),txt1,'HorizontalAlignment','left');
    t.FontSize;
    t.FontSize = 6;
    t=text(x,y(2),txt2,'HorizontalAlignment','left');
    t.FontSize;
    t.FontSize = 6;
    t=text(x,y(3),txt3,'HorizontalAlignment','left');
    t.FontSize;
    t.FontSize = 6;
    t=text(x,y(4),txt4,'HorizontalAlignment','left');
    t.FontSize;
    t.FontSize = 6;
    t=text(x,y(5),txt5,'HorizontalAlignment','left');
    t.FontSize;
    t.FontSize = 6;
    
    
    set(gca,'FontName', 'Lato','TickDir','out','XMinorTick','on','YMinorTick','on');
    hTitle=title(['Travel Time at Lane ',num2str(lane)]);
    hXLabel=xlabel('time intervals (s)');hYLabel=ylabel('frequency');
    set([hTitle, hXLabel, hYLabel], ...
        'FontName'   , 'Lato');
    % set([hLegend, gca]             , ...
    %     'FontSize'   , 8           );
    set([hXLabel, hYLabel]  , ...
        'FontSize'   , 10          );
    set( hTitle                    , ...
        'FontSize'   , 12          , ...
        'FontWeight' , 'bold'      );
    
    axis([0 max(Throughput(:,3)-Throughput(:,2))+5 0 maxFreq])
    
    set(gca,'FontName', 'Lato','TickDir','out','YMinorTick','on','box', 'off');
    ax=gca;
    ax.XTickLabelRotation=90;
%     a = get(gca,'XTickLabel');
%     set(gca,'XTickLabel',a,'FontName','Lato','fontsize',8)
end

set(gcf, 'PaperPositionMode', 'auto');
str = ['sc_freq_',num2str(sc),'.png'];
print (str,'-painters', '-dpng', '-r600');
close(('all'));

%% DELAY
TTfig = figure('Name','DELAY','NumberTitle','off','units','normalized','outerposition',[0 0 1 1],'Color','w');
hold on
AutThroughput=Throughput; 
TT = AutThroughput(:,3)-AutThroughput(:,5)-AutThroughput(:,4);
xbin = min(TT):(max(TT)-min(TT))/10:max(TT);
for lane=1:intersectionConfig.NoOfLanes
    subplot(2,3,lane)
    index = (AutThroughput(:,1) == lane);
    TT = AutThroughput(index,3)-AutThroughput(index,5)-AutThroughput(index,4);
    histTT = histogram(TT,xbin);
    axis([0 inf 0 maxFreq])
    set(histTT,'FaceColor',[255,69,0]/255,'EdgeColor','w');
    
    set(gca,'FontName', 'Lato','TickDir','out','XMinorTick','on','YMinorTick','on');
    hTitle=title(['Travel Time Delay at Lane ',num2str(lane)]);
    hXLabel=xlabel('time intervals (s)');hYLabel=ylabel('frequency');
    set([hTitle, hXLabel, hYLabel], ...
        'FontName'   , 'Lato');
    % set([hLegend, gca]             , ...
    %     'FontSize'   , 8           );
    set([hXLabel, hYLabel]  , ...
        'FontSize'   , 10          );
    set( hTitle                    , ...
        'FontSize'   , 12          , ...
        'FontWeight' , 'bold'      );
    
    set(gca,'FontName', 'Lato','TickDir','out','YMinorTick','on','box', 'off');
    ax=gca;
    ax.XTickLabelRotation=90;
%     a = get(gca,'XTickLabel');
%     set(gca,'XTickLabel',a,'FontName','Lato','fontsize',8)
    
    txt1 =   ['Max : ',num2str(round(max(TT),1)),' sec'];
    txt2 =   ['Min : ',num2str(round(min(TT),1)),' sec'];
    txt3 =   ['Average : ',num2str(round(mean(TT),1)),' sec/veh'];
    txt4 =   ['Standard deviation : ',num2str(round(std(TT),1)),' sec/veh'];
    txt5 =   [[num2str(percentile),'th percentile : '],num2str(round(prctile(TT,percentile),1)),' sec'];
    
    y=[92.5 90 87.5 85 82.5]-60;
    x = 20;
    t=text(x,y(1),txt1,'HorizontalAlignment','left');
    t.FontSize;
    t.FontSize = 6;
    t=text(x,y(2),txt2,'HorizontalAlignment','left');
    t.FontSize;
    t.FontSize = 6;
    t=text(x,y(3),txt3,'HorizontalAlignment','left');
    t.FontSize;
    t.FontSize = 6;
    t=text(x,y(4),txt4,'HorizontalAlignment','left');
    t.FontSize;
    t.FontSize = 6;
    t=text(x,y(5),txt5,'HorizontalAlignment','left');
    t.FontSize;
    t.FontSize = 6;
end

set(gcf, 'PaperPositionMode', 'auto');
str = ['sc_delay_',num2str(sc),'.png'];
print (str,'-painters', '-dpng', '-r600');
close(('all'));
% -----------------------------------Stats--------------------------------------
% fid=fopen('output.txt','w');
% 
% r1 = zeros(1,intersectionConfig.NoOfLanes);
% 
% for l=1:intersectionConfig.NoOfLanes
%     r1(l)=Throughput(l+1,end);
%     fprintf(fid,'%d\n',r1(l));
% end
% fprintf(fid,'%d\n',sum(r1));
% fprintf(fid,'\n');
% 
% for l=1:intersectionConfig.NoOfLanes
%      fprintf(fid,'%2.2f\n',round(mean(TravelTime(2,TravelTime(1,:)==l)),2));
%      
% end
% fprintf(fid,'\n');
% 
% for l=1:intersectionConfig.NoOfLanes
%      fprintf(fid,'%2.2f\n',round(std(TravelTime(2,TravelTime(1,:)==l)),2));
%      
% end
% fprintf(fid,'\n');
% 
% PhVeh=zeros(1,length(phases));
% for p=1:length(PhVeh)
%     fprintf(fid,'%d\n',sum(r1(phases(p).Lanes)));
% end
% fprintf(fid,'\n');
% 
% for i=1:length(PhVeh)
%     indx=signalRecord(3,:)==i;
%      fprintf(fid,'%2.2f\n',round(mean(signalRecord(2,indx)-signalRecord(1,indx)),2));
% end
% fprintf(fid,'\n');
