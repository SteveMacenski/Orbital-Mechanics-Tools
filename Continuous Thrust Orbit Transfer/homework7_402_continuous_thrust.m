clear all;

x = 0:.1:pi;

for i = 1:length(x);
    y(i) =  atan(sin(pi/2*x(i))/(1.5 - cos(pi/2*x(i))));

end


plot(x,cos(y))
xlabel('i in radians');
ylabel('beta in radians');