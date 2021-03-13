 function [T, vlim,alim] = SCurvePara3(q0,q1,v0,v1,vm,am,jm)
 %Case 3 :alim<am
 %  Ta<0
Ta=0;
Tj1=0;
Tv=0;
Td=2*(q1-q0)/(v1+v0);
delta=jm*(jm*(q1-q0)^2+(v1+v0)^2*(v1-v0));
if delta>=0
Tj2=(jm*(q1-q0)-sqrt(delta))/(jm*(v0+v1));
T=[Ta,Tv,Td,Tj1,Tj2];
alim=jm*Tj2;
vlim=v1+(Td-Tj2)*alim;
else
     T=[];
     vlim=[];
     alim=[];
     disp('Error!')
     disp('jm*(jm*(q1-q0)^2+(v1+v0)^2*(v1-v0))<0!')
 end
