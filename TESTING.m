clc
clear
delete('scenario1_TR.bin')

sc = 1;
TRFile  =           fopen(['scenario',num2str(sc),'_TR.bin'],'w');
n=0;
for ii = 1:20
    id = 'xdrf43g';
    x= rand(randi(40,1),2);
    
    fwrite(TRFile,id ,'char');
    fwrite(TRFile,x*1000 ,'int');
   n= n+size(x,1);
end
% clear
sc = 1;
fclose('all');
TRFile = fopen(['scenario',num2str(sc),'_TR.bin'],'r');
Throughput=fread(TRFile,'char')/1000;
fclose(TRFile);




load('GippsTest');

[vehicles(1), signal]  =  TrajectoryEstOptV2( vehicles(1)...
    ,1,signal,intersectionConfig,phasesLib,simParameters,SCFile ); % FOR FDOT THIS FUNCTION ALSO CAN MODIFY SIGNALIZATION

% ARRIVAL VALUES STORED
 




x=-pi:pi/1000:pi;
y=sin(x);

plot(x(100:end),y(100:end));
hold on
plot(x(1:99),y(1:99));


% for x=-3.14:.1:3.14
%     plot(x,sin(x),'X');
%     hold on
% end
pause(2)
close
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

