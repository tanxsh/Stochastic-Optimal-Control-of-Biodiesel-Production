clc;clear;

global a1 a2 a3 a4 a5 a6
a1=3.92e7; a2=5.77e5; a3=5.88e12; a4=0.98e10; a5=5.35e3; a6=2.15e4;


% Ei/R
global b1 b2 b3 b4 b5 b6 dt
b1=6614.83; b2=4997.98; b3=9993.96; b4=7366.64; b5=3231.18; b6=4824.87;

to = 0;dt = 0.01;tf = 100;
Ci = [0.3226;0;0;0;0.85;0]; %at to
zf = [0;0;0;1;0;0]; %at tf
oi = [0;0;0;0;0;0]; %at to
qf = [0;0;0;0;0;0]; %at tf
pf = [0;0;0;0;0;0]; %at tf
wf = [0.001;0.001;0.001;0.001;0.001;0.001]; %at tf
tspan = to:dt:tf;
tspan_bck = tf:-dt:to;
simL = length(tspan);

Tr = ones(simL,1)*323;

tolerance = 2*10^-4;

i=1;
options = odeset('RelTol',1e-5);
while (1)
    disp(i);

[~,C_out] = ode45(@(t,C) dCdt(t,C,Tr), tspan, Ci,options); %forward integration

[~,z_out] = ode45(@(t,z) dZdt(t,z,C_out,Tr), tspan_bck, zf,options); %backward integration 
z_out =  flip(z_out,1);

[~,w_out] = ode45(@(t,w) dWdt(t,w,C_out,Tr), tspan_bck, wf,options); %backward integration 
w_out = flip(w_out,1);

[~,o_out] = ode45(@(t,o) thetaequ(t,o,C_out,Tr), tspan, oi,options); %forward integration
    
[tq,q_out] = ode45(@(t,q) phiequ(t,q,o_out,C_out,z_out,Tr), tspan_bck, qf,options); %backward integration
q_out =  flip(q_out,1);

[tp,p_out] = ode45(@(t,p) psiequ(t,p,o_out,C_out,w_out,Tr), tspan_bck, pf,options); %backward integration
p_out =  flip(p_out,1);

dH = dHdT(o_out,q_out,p_out,C_out,z_out,w_out,Tr);


% figure(1) 
% yyaxis left
% ylim([0,0.9])
% plot(tspan,C_out);
% xlabel('Time [min]');
% ylabel('Concentration (mol/L)');
% yyaxis right
% ylim([0,2])
% 
% figure(2)
% plot(tspan,z_out);
% xlabel('Time [min]');
% ylabel('z');
% 
% figure(3)
% plot(tspan,w_out);
% xlabel('Time[min]');
% ylabel('w');
% 
figure(4)
plot(tspan,o_out);
xlabel('Time[min]');
ylabel('o');

 figure(5)
 plot(tspan,q_out);
 xlabel('Time[min]');
 ylabel('q');
 
 figure(6)
 plot(tspan,p_out);
 xlabel('Time[min]');
 ylabel('p');

figure(7)
plot(tspan,Tr);
hold on
xlabel('time')
ylabel('Tr')

figure(8)
plot(tspan,dH);
hold on
xlabel('time')
ylabel('dh')

   
    if abs(dH)<tolerance
        disp('tolerance met');
        break;
    else 
    if i>11
       
        break;
    else
        disp('iterate again');
        Tr=Tr+(150*dH);
        trc=Tr-273;
        i=i+1;

    end
    end



end 

