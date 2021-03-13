function [q,qd,qdd,T,vlim,alim]=S_Curve1(q0,q1,v0,v1,vm,am,jm,N)
%%
%ÅÐ¶Ï
T=SCurvePara1(q0,q1,v0,v1,vm,am,jm);
if T(2)>0   %Tv>0
         flag=1
else
     [T, vlim] = SCurvePara2(q0,q1,v0,v1,vm,am,jm);
     if T(1)<0||T(3)<0
         flag=3
     elseif T(1)<2*T(4)||T(3)<2*T(5)
         flag=4
     else
         flag=2
     end
end
%%
%Ñ¡Ôñ
switch flag
    case 1
       disp('vmax reached')
       disp('amax reached')
       T
       vlim=vm
       alim=am
    case 2
       disp('vmax not reached')
       disp('amax reached')
       [T, vlim] = SCurvePara2(q0,q1,v0,v1,vm,am,jm)
       alim=am 
    case 3       
       disp('vmax not reached')
       disp('amax reached')
       [T, vlim,alim] = SCurvePara_34(q0,q1,v0,v1,vm,am,jm)
    case 4
       disp('vmax not reached')
       disp('amax not reached')
        [T, vlim] = SCurvePara2(q0,q1,v0,v1,vm,am,jm);
        Ta=T(1);Td=T(3);Tj=T(4);
        alim=am;
        while Ta>2*Tj&&Td>2*Tj
            alim=0.8*alim;
        [T, vlim,alim] = SCurvePara2(q0,q1,v0,v1,vm,alim,jm);
        Ta=T(1);Td=T(3);Tj=T(4);
        end
end      
%%
Tf=T(1)+T(2)+T(3);
t=linspace(0,Tf,N);
q=zeros(1,N);qd=zeros(1,N);qdd=zeros(1,N);
for i = 1:N
    q(i) = S_Scaling(t(i),q0,q1,v0,v1,vlim,alim,jm,T);
    qd(i) = S_Qd_Scaling(t(i),v0,v1,vlim,alim,jm,T);
    qdd(i) = S_Qdd_Scaling(t(i),alim,jm,T);
end
end