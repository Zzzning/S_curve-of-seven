%%
clear
clc
close all
N = 300;
% n=6390;
% vm=2*pi*n/60
% am=20000*pi/4096
% q0=0;q1=pi/2;v0=0;v1=0;
% jm=3000;
%%
%flag=1 vm reached,am reached
% q0=0;q1=10;v0=0;v1=0;vm=0.5*q1;am=q1;jm=3*q1;
% 
%flag=2 vm not reached,am reached
q0=0;q1=10;v0=4;v1=0;vm=10;am=10;jm=30;

%flag=3 vm not reached,am not reached
% q0=0;q1=20;v0=0;v1=15;vm=16;am=5;jm=30;

%flag=4 vm not reached,am not reached
% q0=0;q1=10;v0=7;v1=0;vm=10;am=10;jm=30;
% q0=0;q1=10;v0=0;v1=0;vm=10;am=20;jm=30;

%flag 5
% q0=0;q1=10;v0=0;v1=0;vm=1.5*q1;am=10*q1;jm=50*q1;%vm reached,am not reached
%%
%判断
T=SCurvePara1(q0,q1,v0,v1,vm,am,jm)
if T(2)>0   %Tv>0
    if T(1)==2*T(4)
        flag=5;
    else
        flag=1;
    end
else
     [T, vlim] = SCurvePara2(q0,q1,v0,v1,vm,am,jm);    
     if T(1)<=0||T(3)<=0
         flag=3;
     elseif T(1)<2*T(4)||T(3)<2*T(5)
        flag=4;
        [T, vlim] = SCurvePara2(q0,q1,v0,v1,vm,am,jm);
        Ta=T(1);Td=T(3);Tj=T(4);
        alim=am;
        d1=Ta-2*Tj;
        d2=Td-2*Tj;
     else
         flag=2;
     end
end
%%
%选择
switch flag
    case 1
       disp('vmax reached')
       disp('amax reached')
       T
       vlim=vm;
       alim=am;
    case 2
       disp('vmax not reached')
       disp('amax reached')
       [T, vlim] = SCurvePara2(q0,q1,v0,v1,vm,am,jm)
       alim=am ;
    case 3       
       disp('vmax not reached')
       disp('amax not reached')
       [T, vlim,alim] = SCurvePara_34(q0,q1,v0,v1,vm,am,jm)
    case 4
       disp('vmax not reached')
       disp('amax not reached')
        while d1<=0||d2<=0
        alim=0.8*alim;
        [T, vlim] = SCurvePara2(q0,q1,v0,v1,vm,alim,jm);
        Ta=T(1);Td=T(3);Tj=T(4);
        d1=Ta-2*Tj;
        d2=Td-2*Tj;
        end
    case 5
       disp('vmax reached')
       disp('amax not reached')
       T
       vlim=vm;
       alim=jm*T(4);
end      
%%
Tf=T(1)+T(2)+T(3);
t=linspace(0,Tf,N);
q=zeros(1,N);qd=zeros(1,N);qdd=zeros(1,N);
for i = 1:N
    q(i) = S_Q_Scaling(t(i),q0,q1,v0,v1,vlim,alim,jm,T);
    qd(i) = S_Qd_Scaling(t(i),v0,v1,vlim,alim,jm,T);
    qdd(i) = S_Qdd_Scaling(t(i),alim,jm,T);
end
fprintf('给定最大速度vlim=\n%6.5g\n',vm)
fprintf('实际最大速度vlim=\n%6.5g\n',vlim)
fprintf('给定最大加速度vlim=\n%6.5g\n',am)
fprintf('实际最大加速度alim=\n%6.5g\n',alim)

figure(1)
plot(t,q,'linewidth',1.2)
legend('位移');
xlabel('t');
title('位置曲线');
axis([0,t(N),q0,q1])
figure(2)
% subplot(3,1,2);
plot(t,qd,'linewidth',1.2);
legend('速度');
xlabel('t');
title('速度曲线');
axis([0,t(N),min(v0,v1),vlim])
figure(3)
% subplot(3,1,3);
plot(t,qdd,'linewidth',1.2);
legend('加速度');
xlabel('t');
title('加速度曲线');
axis([0,t(N),-alim,alim])   

% pos = q*2048*120/180;
% xlswrite('pos',pos','Sheet1')
% vel = qd*30*120/pi;
% t(2)
% t1=1000*t(2)*ones(1,N);
% P=[pos;vel;t1];
% fid = fopen('P.txt','wt');
% fprintf(fid,'%0.0f;%0.0f;%0.0f\n',P);
% fclose(fid);




% xlswrite('q2',q'/10,'Sheet1')
% xlswrite('q2',qd','Sheet2')
% xlswrite('q2',qdd','Sheet3')

% Q=floor([q',qd',qdd']*1000);
% xlswrite('Q',Q,'Sheet1');