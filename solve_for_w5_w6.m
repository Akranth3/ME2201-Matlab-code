function [w5,w6] = solve_for_w5_w6(L,T,w2,w3,w4)
%L=[O2A AC AB CB CD DO6 O2B O2O6];
% this function is called in main velocity script.
%for the given values of L,T, angular velocities. 
%this function solves and return the w5 and w6 values.
%the equations using in solving are derived from loopcloser equations.
O2A=L(1);
AC=L(2);
AB=L(3);
CB=L(4);
CD=L(5);
DO6=L(6);
O2B=L(7);
O2O6=L(8);
w5=[];
w6=[];
for i=linspace(1,361,361)
    temp=pinv([ CD*cos(T(4,i)) -DO6*cos(T(5,i)) ;...
        -CD*sin(T(4,i)) DO6*sin(T(5,i)) ])*...
        [-O2A*cos(T(1,i))*w2(i)-AC*cos(T(3,i))*w4(i);O2A*sin(T(1,i))*w2(i)+AC*sin(T(3,i))*w4(i)];
    w5=[w5 temp(1)];
    w6=[w6 temp(2)];
end

end