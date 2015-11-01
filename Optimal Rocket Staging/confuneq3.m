function [ c,ceq ] = confuneq3( x )
%constaint equation for optimal rocket problem

c1 = 3048;
c2 = 3048;
c3 = 3048;

e1 = 1/7;
e2 = 1/7;
e3 = 1/7;

mp = 1000;

vfinal = 6515;

ceq = c1*log((x(1) + x(2) + x(3) +  mp)/(e1*x(1) + x(2) + x(3) + mp)) +...
      c2*log((x(2) + x(3) + mp)/(e2*x(2) + x(3) + mp)) +...
      c3*log((x(3) + mp)/(e3*x(3) + mp)) - vfinal;
c = [];

end

