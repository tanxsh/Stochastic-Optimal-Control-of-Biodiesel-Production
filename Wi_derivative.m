%Derviatives(Wi)
%function out = batchreactor(t,x)
global k1 k2 k3 k4 k5 k6 C1 C2 C3 C4 C5 C6
%w1 = x(1) ; w2 = x(2) ; w3 = x(3) ; w4 = x(4) ; w5 = x(5) ; w6 = x(6) ; 
w1 = 0 ; w2 = 0 ; w3 = 0 ; w4 = 0 ; w5 = 0 ; w6 = 0 ; 
k1=0.05; C5=0.851389971;
dw1bydt=-2*w1(-k1*C5)-2*w2(k1*C5)-2*w4(k1*C5)-2*w5(-k1*C5)
dw2bydt=-2*w1(k2*C4)-2*w2(-k2*C4-k3*C5)-2*w3(k3*C5)-2*w4(-k2*C4+k3*C5)
dw3bydt=-2*w2(k4*C4)-2*w3(-k4*C4-k5*C5)-2*w4(-k4*C4+k5*C5)-2*w6(k5*C5)
dw4bydt=-2*w1(k2*C2)-2*w2(-k2*C2+k4*C1)-2*w3(-k4*C1+k6*C6)-2*w4(-k2*C2-k4*C1-k6*C6)-2*w5(k2*C2+k4*C1+k6*C6)-2*w6(-k6*C6)
dw5bydt=-2*w1(-k1*C3)-2*w2(k1*C3-k3*C2)-2*w3(k3*C2-k5*C1)-2*w4(k1*C3+k3*C2+k5*C1)-2*w5(-k1*C3-k3*C2-k5*C1)-2*w6(k5*C1)
dw6bydt=-2*w3(k6*C4)-2*w4(-k6*C4)-2*w5(k6*C4)-2*w6(-k6*C4)

out = [dw1bydt; dw2bydt; dw3bydt; dw4bydt; dw5bydt; dw6bydt]
%%end
