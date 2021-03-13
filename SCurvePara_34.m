 function [T, vlim,alim] = SCurvePara_34(q0,q1,v0,v1,vm,am,jm)
 %Case 4  :alim<am
 %  Td<0 or Ta<0
 [TT, ~] = SCurvePara2(q0,q1,v0,v1,vm,am,jm);
 Ta=TT(1);
 Td=TT(3);
 if Ta<0
   [T1, vlim1,alim1] = SCurvePara3(q0,q1,v0,v1,vm,am,jm);
 elseif Td<0
   [T1, vlim1,alim1] = SCurvePara4(q0,q1,v0,v1,vm,am,jm);
 end
 T=T1;
 vlim=vlim1;
 alim=alim1;
 end
