%R V to classical elements 

%define r and v
r = [-3*sqrt(2)/2,0,-3*sqrt(2)/2];
v = [0,-sqrt(6)/6,0];

%define mu
mu = 1;

%finds h via cross product, then finds n
h = cross(r,v);
n = cross([0,0,1],h);

%finds e vector and scalar. 
e = ((norm(v)^2 - (mu/norm(r))).*r - (dot(r,v).*v))./mu;
E = norm(e);

%visa viva
energy = (((norm(v).^2)./(2)) - (mu./norm(r)));

if E ~= 1;
    a = -mu./(2*energy);
    p = a.*(1-E.^2);
else
    p = norm(h).^2./mu;
    a = inf ;
end 

%finds i, omega_big, omega_small, and f
i = acosd(h(3)./norm(h));
Lomega = acosd(n(1)./norm(n));
Somega = acosd(dot(n,e)./(norm(n).*norm(e)));
f = acosd(dot(e,r)./(norm(e).*norm(r)));

%finds conditional values 
if n(2) < 0 ;
    Lomega = 360 - Lomega;
end 

if e(3) < 0 ;
    Somega = 360 - Somega;
end 

if dot(r,v) < 0 ;
    f = 360 - f;
end 

%prints results 

fprintf('Classical elements\nenergy = %f\n',energy)
fprintf('ecentricity = %f\n',E)
fprintf('true anamoly = %f\n',f)
fprintf('i = %f\n',i)
fprintf('Large Omega = %f\n',Lomega)
fprintf('small Omega = %f\n',Somega)
fprintf('p = %f\n',p)
fprintf('a = %f\n',a)
