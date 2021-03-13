 function [T, vlim] = SCurvePara2(q0,q1,v0,v1,vm,am,jm)
 %Case 2 :vlim<vm
 % the constant velocity segment is not present(Tv=0)
Tj1=am/jm;
Tj2=Tj1;
delta=am^4/jm^2+2*(v0^2+v1^2)+am*(4*(q1-q0)-2*am/jm*(v0+v1));
Ta=(am^2/jm-2*v0+sqrt(delta))/(2*am);
Td=(am^2/jm-2*v1+sqrt(delta))/(2*am);
Tv=0;
T=[Ta,Tv,Td,Tj1,Tj2];
vlim=am*(Ta-Tj1)+v0;
 end
