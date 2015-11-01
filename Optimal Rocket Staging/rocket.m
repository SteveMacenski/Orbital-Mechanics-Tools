% AE 402 code to minimize stage weight of a 3 stage rocket 

x0 = [7000,3000,1000]; %inital guess for m1 m2 m3 
options = optimset('LargeScale','off','display','iter');
x = fmincon(@objfun3,x0,[],[],[],[],[],[],@confuneq3,options);
x
f = objfun3(x)
[c,ceq] = confuneq3(x)
