function dH = dHdT(theta,phi,psi,C,z,w,T)

global a1 a2 a3 a4 a5 a6 b1 b2 b3 b4 b5 b6

k1 = a1*exp(-b1./T); k2 = a2*exp(-b2./T); 
k3 = a3*exp(-b3./T); k4 = a4*exp(-b4./T); 
k5 = a5*exp(-b5./T); k6 = a6*exp(-b6./T);

C1 = C(:,1);C2 = C(:,2);C3 = C(:,3);
C4  = C(:,4);C5  = C(:,5);C6 = C(:,6);
z1 = z(:,1);z2 = z(:,2);z3 = z(:,3);
z4 = z(:,4);z5 = z(:,5);z6 = z(:,6);


dhdc1 = -z1.*k1.*C5+ z2.*k1.*C5+ z4.*k1.*C5- z5.*k1.*C5;
dhdc2 =  z1.*k2.*C4-z2.*k2.*C4-z2.*k3.*C5+z3.*k3.*C5-z4.*k2.*C4+z4.*k3.*C5+z5.*k2.*C4-z5.*k3.*C5;
dhdc3 =  z2.*k4.*C4-z3.*k4.*C4-z3.*k5.*C5+z4.*k4.*C5+z4.*k5.*C5-z5.*k4.*C5-z5.*k5.*C5+z6.*k5.*C5;
dhdc4 =  z1.*k2.*C2-z2.*k2.*C2+z2.*k4.*C3-z3.*k4.*C3+z3.*k6.*C6-z4.*k2.*C2-z4.*k6.*C6+z5.*k2.*C2+z5.*k6.*C6-z6.*k6.*C6;
dhdc5 = -z1.*k1.*C1+z2.*k1.*C1-z2.*k3.*C2+z3.*k3.*C2-z3.*k5.*C3+z4.*k1.*C1+z4.*k3.*C2-z4.*k4.*C3+z4.*k5.*C3-z5.*k1.*C1-z5.*k3.*C2+z5.*k4.*C3-z5.*k5.*C3+z6.*k5.*C3;
dhdc6 =  z3.*k6.*C4-z4.*k6.*C4+z5.*k6.*C4-z6.*k6.*C4;

dHdC = [dhdc1,dhdc2,dhdc3,dhdc4,dhdc5,dhdc6];

dhdz1=-C1.*C5.*k1+C2.*C4.*k2;
dhdz2=C1.*C5.*k1-C2.*C4.*k2-C2.*C5.*k3+C3.*C4.*k4;
dhdz3=C2.*C5.*k3-C3.*C4.*k4-C3.*C5.*k5+C6.*C4.*k6; 
dhdz4=C1.*C5.*k1-C2.*C4.*k2+C2.*C5.*k3-C3.*C4.*k4+C3.*C5.*k5-C6.*C4.*k6;
dhdz5=-C1.*C5.*k1+C2.*C4.*k2-C2.*C5.*k3+C3.*C4.*k4-C3.*C5.*k5+C6.*C4.*k6;
dhdz6=C3.*C5.*k5-C6.*C4.*k6;

dHdz = [dhdz1,dhdz2,dhdz3,dhdz4,dhdz5,dhdz6];

% dHdz =  [C2.*C4.*k2 - C5.*C1.*k1,...
%          C4.*C3.*k4 - C2.*C4.*k2 - C5.*C2.*k3 + C5.*C1.*k1,...
%          C5.*C2.*k3 + C4.*C6.*k6 - C5.*C3.*k5 - C4.*C3.*k4,...
%          C5.*C2.*k3 - C2.*C4.*k2 - C4.*C6.*k6 + C5.*C3.*k5 - C4.*C3.*k4 + C5.*C1.*k1,...
%          C2.*C4.*k2 - C5.*C2.*k3 + C4.*C6.*k6 - C5.*C3.*k5 + C4.*C3.*k4 - C5.*C1.*k1,...
%          C5.*C3.*k5 - C4.*C6.*k6];

 dhdw1 = 0.000520358122848978;
 dhdw2 = 0.0005202544116862805;
 dhdw3 = 0.00052025025055205;
 dhdw4 = 0.00052022702592245;
 dhdw5 = 0.0005205210170117445;
 dhdw6 = 0.000520212768837192;

 dHdw = [dhdw1,dhdw2,dhdw3,dhdw4,dhdw5,dhdw6];

dH = sum(dHdC.*theta,2) + sum(dHdz.*phi,2) + sum(psi.*dHdw,2);
