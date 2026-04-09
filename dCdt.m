function F = dCdt(t,C,T)

 global a1 a2 a3 a4 a5 a6 b1 b2 b3 b4 b5 b6 dt
 t = ceil(t/dt)+1;
 
 k1 = a1*exp(-b1/T(t)); k2 = a2*exp(-b2/T(t)); 
 k3 = a3*exp(-b3/T(t)); k4 = a4*exp(-b4/T(t)); 
 k5 = a5*exp(-b5/T(t)); k6 = a6*exp(-b6/T(t));
 
 C_TG = C(1); C_DG = C(2); C_MG = C(3); C_E = C(4); C_A = C(5); C_GL = C(6);
 
 F1 = -k1*C_TG*C_A + k2*C_DG*C_E;
 F2 =  k1*C_TG*C_A - k2*C_DG*C_E - k3*C_DG*C_A + k4*C_MG*C_E;
 F3 =  k3*C_DG*C_A - k4*C_MG*C_E - k5*C_MG*C_A + k6*C_GL*C_E;
 F4 =  k1*C_TG*C_A - k2*C_DG*C_E + k3*C_DG*C_A - k4*C_MG*C_E + k5*C_MG*C_A...
     -k6*C_GL*C_E;
 F5 = -F4;
 F6 = k5*C_MG*C_A - k6*C_GL*C_E;
 
 F =[F1;F2;F3;F4;F5;F6];