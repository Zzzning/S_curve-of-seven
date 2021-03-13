 function [T] = SCurvePara1(q0,q1,v0,v1,vm,am,jm)
 %Case 1 :vlim=vm
 % the constant velocity segment is present
 if vm>=v0
 if (vm-v0)*jm<am^2
     Tj1=sqrt((vm-v0)/jm);
     Ta=2*Tj1;
 else
     Tj1=am/jm;
     Ta=Tj1+(vm-v0)/am;
 end
 
 if (vm-v1)*jm<am^2
     Tj2=sqrt((vm-v1)/jm);
     Td=2*Tj2;
 else
     Tj2=am/jm;
     Td=Tj2+(vm-v1)/am;
 end
 
 Tv=(q1-q0)/vm-Ta/2*(1+v0/vm)-Td/2*(1+v1/vm);
 
 T=[Ta,Tv,Td,Tj1,Tj2];
 else
     T=[];
     disp('Error!')
     disp('vm<v0')
 end
 end
