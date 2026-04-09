function X_final = rk4_(dydx,t_initial,t_final,X_initial,u)

h = t_final-t_initial;

k1 = dydx(t_initial,X_initial,u);
k2 = dydx(t_initial+h/2,X_initial+k1*h/2,u);
k3 = dydx(t_initial+h/2,X_initial+k2*h/2,u);
k4 = dydx(t_initial+h,X_initial+k3*h,u);
    
X_final = X_initial + h/6*(k1 + 2*k2 + 2*k3 + k4);
end

