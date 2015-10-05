%Define the values for each input
mu = 398600.4418;
a = input('input a');
e = input('input e');
i = input('input i');
RAAN = input('input RAAN');
Somega = input('input Somega');
f = input('input f');

%finds theta
theta = Somega + f;

%using vis viva, infind the scalar values for r,v
r = (a.*(1-e.^2))./(1+e.*cos(f));
v = sqrt(mu.*((2./r)-(1./a)));
h = sqrt(mu.*a.*(1-e.^2));

%using g,f functions it finds the vectors
Rvector = r.*[cosd(RAAN).*cosd(theta)-sind(RAAN).*sind(theta).*cosd(i), sind(RAAN).*cosd(theta)+cosd(RAAN).*sind(theta).*cosd(i), sind(theta).*sind(i)];
Vvector = -(mu./h).*[cosd(RAAN).*(sind(theta)+e.*sind(Somega))+sind(RAAN).*(cosd(theta)+e.*cosd(Somega)).*cosd(i), sind(RAAN).*(sind(theta)+e.*sind(Somega))-cosd(RAAN).*(cosd(theta)+e.*cosd(Somega)).*cosd(i), (-(cosd(theta)+e.*cosd(Somega)).*sind(i))];

%prints results
fprintf('Velocity: (%f, %f, %f)\n',Vvector);
fprintf('Radius: (%f, %f, %f)\n',Rvector);

