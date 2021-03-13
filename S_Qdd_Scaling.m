 function qdd = S_Qdd_Scaling(t,am,jm,T)

Ta=T(1);
Tv=T(2);
Td=T(3);
Tj1=T(4);
Tj2=T(5);
Tf=Ta+Tv+Td;
%%
if (t >= 0 && t <= Tj1)
    qdd = jm*t;
elseif ( t > Tj1 && t <= Ta-Tj1 )
    qdd = am;
elseif ( t > Ta-Tj1  && t <= Ta )
    qdd = jm*(Ta-t);
elseif ( t > Ta && t <= Ta+Tv )
    qdd = 0; 
elseif ( t > Tf-Td && t <= Tf-Td+Tj2 )
    qdd = -jm*(t-Tf+Td);
elseif ( t > Tf-Td+Tj2 && t <= Tf-Tj2 )
    qdd = -am;
elseif ( t > Tf-Tj2 && t <= Tf)  
    qdd = -jm*(Tf-t);
end
 
end
