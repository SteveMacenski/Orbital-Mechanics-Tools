# Senior design, finds delta V from Trans-Mars Injection Orbit to Mars Orbital R
import math

def brake_dv(r_mars_orbit,delta_i1,delta_i2):
    #inputs r of mars orbit, and 2 inclination changes
    mu_sun = 1.327235e20; #m^2/s^2
    mu_earth = 3.986e14;
    mu_mars = 4.2828e13;
    r_mars =227.94e9; #m
    r_earth = 149.6e9; #m
    
    delta_i1 = math.radians(delta_i1);
    delta_i2 = math.radians(delta_i2);

    aMTO = 0.5*(r_earth + r_mars);
    
    r_SOIm = 0.576e9; #m
    
    #V at mars for mars transfer orbit
    v_SOIm = -math.sqrt(mu_sun*(2/r_mars - 1/aMTO)) + math.sqrt(mu_sun/r_mars);
    a_MTOm = 1/(2/r_SOIm - v_SOIm*v_SOIm/mu_mars);
    
    #V mars transfer at mars
    v_rend = math.sqrt(mu_mars*(2/r_mars_orbit - 1/a_MTOm));

    #V at final orbit
    v_LMO = math.sqrt(mu_mars/r_mars_orbit); #V mars low orbit

    #DV for inclination change
    delta_v_inclination1 = 2*v_LMO*math.sin(delta_i1/2);
    delta_v_inclination2 = 2*v_LMO*math.sin(delta_i2/2);

    print "[delta v tot for incline 1 km/s, delta v tot for incline 2 km/s]"
    return [(v_rend-v_LMO)/1000+delta_v_inclination1/1000, \
            (v_rend-v_LMO)/1000+delta_v_inclination2/1000]; #delta V total

if __name__=="__main__"():
    Isp = 318;
    delta_V = brake_dv(11000e3,0,20);
    mass_ratio1 = math.exp(delta_V[0]*1000/9.81/Isp);
    mass_ratio2 = math.exp(delta_V[1]*1000/9.81/Isp);

    print delta_V, 1-1./mass_ratio1, 1-1./mass_ratio2;


