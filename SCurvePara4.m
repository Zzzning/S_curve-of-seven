 function [T, vlim,alim] = SCurvePara4(q0,q1,v0,v1,vm,am,jm)
 %Case 4  :alim<am
 %  Td<0
Td=0;
Tj2=0;
Tv=0;
Ta=2*(q1-q0)/(v1+v0);
delta=jm*(jm*(q1-q0)^2-(v1+v0)^2*(v1-v0));
if delta>=0
Tj1=(jm*(q1-q0)-sqrt(delta))/(jm*(v0+v1));
T=[Ta,Tv,Td,Tj1,Tj2];
alim=jm*Tj1;
vlim=v0+(Ta-Tj1)*alim;
else
     T=[];
     vlim=[];
     alim=[];
     disp('Error!')
     disp('jm*(jm*(q1-q0)^2+(v1+v0)^2*(v1-v0))<0!')
 end
