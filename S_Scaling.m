 function s = S_Scaling(t,q0,q1,v0,v1,vm,am,jm,T)

Ta=T(1);
Tv=T(2);
Td=T(3);
Tj1=T(4);
Tj2=T(5);
Tf=Ta+Tv+Td;
%%
if (t >= 0 && t <= Tj1)
    s = q0+v0*t+1/6 * jm * t^3;
elseif ( t > Tj1 && t <= Ta-Tj1 )
    s = q0+v0*t+am*(3*t^2-3*Tj1*t+Tj1^2)/6;
elseif ( t > Ta-Tj1  && t <= Ta )
    s = q0+(vm+v0)*Ta/2-vm*(Ta-t)+jm*(Ta-t)^3/6;%jmin=-jm
elseif ( t > Ta && t <= Ta+Tv )
    s = q0+(vm+v0)*Ta/2+vm*(t-Ta); 
elseif ( t > Tf-Td && t <= Tf-Td+Tj2 )
    s = q1-(vm+v1)*Td/2+vm*(t-Tf+Td)-jm*(t-Tf+Td)^3/6;
elseif ( t > Tf-Td+Tj2 && t <= Tf-Tj2 )
    s = q1-(vm-v1)*Td/2+vm*(t-Tf+Td)-am/6*(3*(t-Tf+Td)^2-3*Tj2*(t-Tf+Td)+Tj2^2);
elseif ( t > Tf-Tj2 && t <= Tf )
    s = q1-v1*(Tf-t)-jm*(Tf-t)^3/6;    
end
 
end
