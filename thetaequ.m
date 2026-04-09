function out = thetaequ(t,o,C,T)

 global a1 a2 a3 a4 a5 a6 b1 b2 b3 b4 b5 b6 dt

 t = ceil(t/dt)+1;

 k1 = a1*exp(-b1/T(t)); k2 = a2*exp(-b2/T(t)); 
 k3 = a3*exp(-b3/T(t)); k4 = a4*exp(-b4/T(t)); 
 k5 = a5*exp(-b5/T(t)); k6 = a6*exp(-b6/T(t));

 dk1 =b1/T(t).^2*(a1*exp(-b1/T(t))); dk2 = b2/T(t).^2*(a2*exp(-b2/T(t))); 
 dk3 = b3/T(t).^2*(a3*exp(-b3/T(t))); dk4 = b4/T(t).^2*(a4*exp(-b4/T(t))); 
 dk5 = b5/T(t).^2*(a5*exp(-b5/T(t))); dk6 = b6/T(t).^2*(a6*exp(-b6/T(t)));
 
 C_TG = C(t,1); C_DG = C(t,2); C_MG = C(t,3); C_E = C(t,4); C_A = C(t,5); C_GL = C(t,6);
 o1= o(1); o2 = o(2); o3 = o(3); o4 = o(4); o5 = o(5); o6 = o(6);


do1=-(dk1*C_TG*C_A)-(k1*o1*C_A)-(k1*C_TG*o5)+(dk2*C_DG*C_E)+(k2*o2*C_E)+(k2*C_DG*o4);
do2=(dk1*C_TG*C_A+k1*o1*C_A+k1*C_TG*o5)-(dk2*C_DG*C_E+k2*o2*C_E+k2*C_DG*o4)-(dk3*C_DG*C_A+k3*o2*C_A+k3*C_DG*o5)+(dk4*C_MG*C_E+k4*o3*C_E+k4*C_MG*o4);
do3=(dk3*C_DG*C_A+k3*o2*C_A+k3*C_DG*o5)-(dk4*C_MG*C_E+k4*o3*C_E+k4*C_MG*o4)-(dk5*C_MG*C_A+k5*o3*C_A+k5*C_MG*o5)+(dk6*C_GL*C_E+k6*o6*C_E+k6*C_GL*o4);
do4=(dk1*C_TG*C_A+k1*o1*C_A+k1*o5*C_TG)-(dk2*C_DG*C_E+k2*o2*C_E+k2*C_DG*o4)+(dk3*C_DG*C_A+k3*o2*C_A+k3*C_DG*o5)-(dk4*C_MG*C_E+k4*o3*C_E+k4*C_MG*o4)+(dk5*C_MG*C_A+k5*o3*C_A+k5*C_MG*o5)-(dk6*C_GL*C_E+k6*o6*C_E+k6*o4*C_GL);
do5=-(dk1*C_TG*C_A+k1*o1*C_A+k1*o5*C_TG)+(dk2*C_DG*C_E+k2*o2*C_E+k2*C_DG*o4)-(dk3*C_DG*C_A+k3*o2*C_A+k3*C_DG*o5)+(dk4*C_MG*C_E+k4*o3*C_E+k4*C_MG*o4)-(dk5*C_MG*C_A+k5*o3*C_A+k5*C_MG*o5)+(dk6*C_GL*C_E+k6*o6*C_E+k6*o4*C_GL);
do6=(dk5*C_MG*C_A+k5*o3*C_A+k5*o5*C_MG)-(dk6*C_GL*C_E+k6*o6*C_E+k6*o4*C_GL);

out=[do1;do2;do3;do4;do5;do6];
end

