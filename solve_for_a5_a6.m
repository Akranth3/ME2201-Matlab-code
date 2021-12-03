function [a5,a6] = solve_for_a5_a6(L,T,w2,w3,w4,w5,w6,a2,a3)
% this function is called in main accleration script.
%for the given values of L,T, angular velocities, a2 and a3 
%this function solves and return the a5 and a6 values.
%the equations using in solving are derived from loopcloser equations.
O2A=L(1);
AC=L(2);
AB=L(3);
CB=L(4);
CD=L(5);
DO6=L(6);
O2B=L(7);
O2O6=L(8);
a5=[];
a6=[];
%CB*sin(T(2,i))*(w3(i)^2)-CB*cos(T(2,i))*a3(i)
for i=linspace(1,361,361)
    temp=pinv([CD*cos(T(4,i)) -DO6*cos(T(5,i));...
        -CD*sin(T(4,i)) DO6*sin(T(5,i))])*...
        [AC*sin(T(3,i))*(w4(i)^2)+O2A*sin(T(1,i))*(w2(i)^2)-O2A*cos(T(1,i))*a2-AC*cos(T(3,i))*a3(i)+ ...
        CD*sin(T(4,i))*(w5(i)^2)-DO6*sin(T(5,i))*(w6(i)^2);...
        O2A*cos(T(1,i))*(w2(i)^2)+O2A*sin(T(1,i))*a2+AC*sin(T(3,i))*a3(i)+ ...
        AC*cos(T(3,i))*(w4(i)^2)+CD*cos(T(4,i))*(w5(i)^2)- ...
        DO6*cos(T(5,i))*(w6(i)^2)];
    a5=[a5 temp(1)];
    a6=[a6 temp(2)];
end


end