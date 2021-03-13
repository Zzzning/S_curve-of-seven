 function qd = S_Qd_Scaling(t,v0,v1,vlim,alim,jm,T)

Ta=T(1);
Tv=T(2);
Td=T(3);
Tj1=T(4);
Tj2=T(5);
Tf=Ta+Tv+Td;
%%
if (t >= 0 && t <= Tj1)
    qd = v0+jm*t^2/2;
elseif ( t > Tj1 && t <= Ta-Tj1 )
    qd = v0+alim*(t-Tj1/2);
elseif ( t > Ta-Tj1  && t <= Ta )
    qd = vlim-jm*(t-Ta)^2/2;%jmin=-jm;
elseif ( t > Ta && t <= Ta+Tv )
    qd = vlim; 
elseif ( t > Tf-Td && t <= Tf-Td+Tj2 )
    qd = vlim-jm*(t-Tf+Td)^2/2;
elseif ( t > Tf-Td+Tj2 && t <= Tf-Tj2 )
    qd = vlim-alim*(t-Tf+Td-Tj2/2);
elseif ( t > Tf-Tj2 && t <= Tf )
    qd = v1+jm*(Tf-t)^2/2;   
end
 
end
