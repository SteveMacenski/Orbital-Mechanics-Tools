% AE 402 homework 6 

%hohmann transfer from earth to uranus - Problem 1

mu = 132712440018; %km^3/s^2
                                            %mu = 3.96401599e-14 %au^3/s^2;
r.earth = 1; %au
r.earth_in_km = r.earth*(1/6.68459e-9); %in km
r.uranus = 19.19; %au
r.uranus_in_km = r.uranus*(1/6.68459e-9); %in km

R = r.uranus_in_km / r.earth_in_km;

%part a
Vc2 = sqrt(mu/r.uranus_in_km);
Vc1 = sqrt(R)*Vc2;

deltaV = Vc1*(sqrt(2*R/(1+R)) - 1 + 1/sqrt(R) - sqrt(2/(R*(R+1))));

a_h = (r.earth_in_km + r.uranus_in_km)/2;
time_flight = pi*sqrt(a_h^3/mu);


%part b
beta12 = pi*(1 - sqrt(1/8*(1 + 1/R)^3));
beta21 = pi*(1 - ((1+R)/2)^(3/2));

%part c is a drawing

%part d
T.earth = 2*pi*sqrt(r.earth_in_km^3/mu);
T.uranus = 2*pi*sqrt(r.uranus_in_km^3/mu);
deltaTsynodic = (T.earth*T.uranus)/(T.uranus - T.earth);



% Problem 2 - assuming inclination is 20 degrees for arguments sake 
tf_hoh = pi*sqrt(a_h^3/mu);

%part b, bi-parabolic
fminbnd(@(delta) sqrt(42.1219^2 + 29.7847^2 -2*29.7847*42.1219*cosd(delta)) + sqrt(6.7992^2 + 9.6155^2 -2*6.7992*9.6155*cosd(20-delta)) ,0,90);

%part c, bi-elliptic
r.interm = 1.5*r.uranus_in_km;

eqn = @(delta) sqrt(41.4088^2 + 29.7847^2 -2*41.4088*29.7847*cosd(delta(1)))...
                           +sqrt(4.9654^2 + 1.4386^2 -2*4.9654*1.4386*cosd(delta(2)))...
                           +sqrt(6.7992^2 + 7.4481^2 -2*7.4481*6.7992*cosd(20-delta(1)-delta(2)));
fminsearch(eqn,[90 90],[0 0]);



