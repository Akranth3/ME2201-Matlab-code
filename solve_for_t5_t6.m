function T2 = solve_for_t5_t6(L,T,guess)
%L=[O2A AC AB CB CD DO6 O2B O2O6];
% this function is used by the main angles script to find t5 and t6
% angles... for given L,T.
%T=[t2;t3;t4]

T2=[];
%T2=[t5;t6]
for i=linspace(1,361,361)
    T2=[T2 find_t5_t6(L,T(1,i),T(2,i),T(3,i),guess)];

end
% %%*****t5*****%%
% figure
% plot(T(1,:)*180/pi,T2(1,:)*180/pi)
% xlabel('t2')
% ylabel('t5')
% title('Plot for \theta_5')
% grid on

% %%*****t6*****%%
% figure 
% plot(T(1,:)*180/pi,T2(2,:)*180/pi)
% xlabel('\theta_2')
% ylabel('\theta_6')
% title('Angular position of link 6')
% grid on

end