% close('all');
% fclose('all');
% delete('*.txt')
% 

% sc                          =           1;

% fid = fopen('table.txt','w');

% filename = ['scenario',num2str(sc),'_input.mat'];
% load (filename);

% fprintf(fid,'%d\n',commRange); % commRange

% for lane = 1:intersectionConfig.NoOfLanes
%     fprintf(fid,'%2.1f (%2.1f)\n',MeanSD(lane,1),MeanSD(lane,2));
% end
% fprintf(fid,'%d%%\n',AVPercent*100);

TTFile = fopen(['scenario',num2str(sc),'_TT.bin'],'r');    Throughput=fread(TTFile,'int')/1000;fclose(TTFile);
Throughput = transpose(reshape(Throughput,[6 length(Throughput)/6]));
% for lane = 1:intersectionConfig.NoOfLanes
%     index = Throughput(:,1) == lane;
%     TT = Throughput(index,3)-Throughput(index,2);
%     fprintf(fid,'%2.1f (%2.1f)\n',(round(mean(TT),1)),(round(std(TT),1)));
% end
RESULT(sc,5+3*(jj-1)) = mean(Throughput(:,3)-Throughput(:,2));

D = Throughput(:,3)-Throughput(:,5)-Throughput(:,4);
% for lane = 1:intersectionConfig.NoOfLanes
%     index = Throughput(:,1) == lane;
%     fprintf(fid,'%2.1f (%2.1f)\n',round(mean(D(index)),1),round(std(D(index)),1));
% end
RESULT(sc,5+3*(jj-1)+1) = mean(Throughput(:,3)-Throughput(:,5)-Throughput(:,4));

SCFile = fopen(['scenario',num2str(sc),'_SC.bin'],'r');    signalRecord=fread(SCFile,'int')/1000;fclose(SCFile);
signalRecord = transpose(reshape(signalRecord,[5 length(signalRecord)/5]));
ii = 2;
while ii <= size(signalRecord,1)
    if signalRecord(ii,2) == signalRecord(ii-1,2)
        signalRecord(ii-1,:) = [];
    else
        ii = ii + 1;
    end
end
Sig = signalRecord(:,3)+signalRecord(:,4);
% for phase = intersectionConfig.phaseSet
%     index = signalRecord(:,1) == phase;
%     fprintf(fid,'%2.1f (%2.1f)\n',round(mean(Sig(index)),1),round(std(Sig(index)),1));
% end
RESULT(sc,5+3*(jj-1)+2) = mean(Sig);
% status=fclose(fid);
% 
% close all;