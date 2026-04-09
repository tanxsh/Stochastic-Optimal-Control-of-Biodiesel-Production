function out = phiequ(t,q,o,C,z,T)

 global a1 a2 a3 a4 a5 a6 b1 b2 b3 b4 b5 b6 dt
 t = ceil(t/dt)+1;
 
  dk1 =b1/T(t).^2*(a1*exp(-b1/T(t))); dk2 = b2/T(t).^2*(a2*exp(-b2/T(t))); 
 dk3 = b3/T(t).^2*(a3*exp(-b3/T(t))); dk4 = b4/T(t).^2*(a4*exp(-b4/T(t))); 
 dk5 = b5/T(t).^2*(a5*exp(-b5/T(t))); dk6 = b6/T(t).^2*(a6*exp(-b6/T(t)));

  k1 = a1*exp(-b1/T(t)); k2 = a2*exp(-b2/T(t)); 
 k3 = a3*exp(-b3/T(t)); k4 = a4*exp(-b4/T(t)); 
 k5 = a5*exp(-b5/T(t)); k6 = a6*exp(-b6/T(t));
 
C_TG = C(t,1); C_DG = C(t,2); C_MG = C(t,3); C_E = C(t,4); C_A = C(t,5); C_GL = C(t,6);
z1 = z(t,1) ; z2 = z(t,2) ; z3 = z(t,3) ; z4 = z(t,4) ; z5 = z(t,5) ; z6 = z(t,6) ;

o1 = o(t,1); o2 = o(t,2); o3 = o(t,3); o4 = o(t,4); o5 = o(t,5); o6 = o(t,6);
q1 = q(1); q2 = q(2); q3 = q(3); q4 = q(4); q5 = q(5); q6 = q(6);


dq1=(q1*k1*C_A+z1*dk1*C_A+z1*k1*o5)-(q2*k1*C_A+z2*dk1*C_A+z2*k1*o5)-(q4*k1*C_A+z4*dk1*C_A+z4*k1*o5)+(q5*k1*C_A+z5*dk1*C_A+z5*k1*o5);
dq2=-(q1*k2*C_A+z1*dk2*C_A+z1*k2*o5)+(q2*k2*C_E+z2*dk2*C_E+z2*k2*o4)+(q2*k3*C_A+z2*dk3*C_A+z2*k3*o5)-(q3*k3*C_A+z3*dk3*C_A+z3*k3*o5)+(q4*k2*C_E+z4*dk2*C_E+z4*k2*o4)+(q4*k3*C_A+z4*dk3*C_A+z4*k3*o5)-(q5*k2*C_E+z5*dk2*C_E+z5*k2*o4)+(q5*k3*C_A+z5*dk3*C_A+z5*k3*o5);
dq3=-(q2*k4*C_E+z2*dk4*C_E+z2*k4*o4)+(q3*k4*C_E+z3*dk4*+z3*k4*o4)+(q3*k5*C_A+z3*dk5*C_A+z3*k5*o5)+(q4*k4*C_E+z4*dk4*C_E+z4*k4*o4)-(q4*k5*C_A+z4*dk5*C_A+z4*k5*o5)-(q5*k4*C_E+z5*dk4*C_E+z5*k4*o4)+(q5*k5*C_A+z5*dk5*C_A+z5*k5*o5)-(q6*k5*C_A+z6*dk5*C_A+z6*k5*o5);
dq4=-(q1*k2*C_DG+z1*dk2*C_DG+z1*k2*o2)+(q2*k2*C_DG+z2*dk2*C_DG+z2*k2*o2)-(q2*k4*C_MG+z2*dk4*C_MG+z2*k4*o3)+(q3*k4*C_MG+z3*dk4*C_E+z3*k4*o3)-(q3*k6*C_GL+z3*dk6*C_GL+z3*k6*o6)+(q4*k2*C_DG+z4*dk2*C_DG+z4*k2*o2)+(q4*k4*C_MG+z4*dk4*C_MG+z4*k4*o3)+(q4*k6*C_GL+z4*dk6*C_GL+z4*k6*o6)-(q5*k2*C_DG+z5*dk2*C_DG+z5*k2*o2)-(q5*k4*C_MG+z5*dk4*C_MG+z5*k4*o3)-(q5*k6*C_GL+z5*dk6*C_GL+z5*k6*o6)+(q6*k6*C_GL+z6*dk6*C_GL+z6*k6*o6);
dq5=(q1*k1*C_TG+z1*dk1*C_TG+z1*k1*o1)-(q2*k1*C_TG+z2*dk1*C_TG+z2*k1*o1)+(q2*k3*C_DG+z2*dk3*C_DG+z2*k3*o2) -(q3*k3*C_DG+z3*dk3*C_DG+z3*k3*o2)+(q3*k5*C_MG+z3*dk5*C_MG+z3*k5*o3)-(q4*k1*C_TG+z4*dk1*C_TG+z4*k1*o1)-(q4*k3*C_DG+z4*dk3*C_DG+z4*k3*o2)-(q4*k5*C_MG+z4*dk5*C_MG+z4*k5*o3)+(q5*k1*C_TG+z5*dk1*C_TG+z5*k1*o1)+(q5*k3*C_DG+z5*dk3*C_DG+z5*k3*o2)+(q5*k5*C_MG+z5*dk5*C_MG+z5*k5*o3)-(q6*k5*C_MG+z6*dk5*C_MG+z6*k5*o3);
dq6=-(q3*k6*C_E+z3*dk6*C_E+z3*k6*o4)-(q4*k6*C_E+z4*dk6*C_E+z4*k6*o4)-(q5*k6*C_E+z5*dk6*C_E+z5*k6*o4)+(q6*k6*C_E+z6*dk6*C_E+z6*k6*o4);


out=[dq1;dq2;dq3;dq4;dq5;dq6];
end


