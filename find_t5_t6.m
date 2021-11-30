function T = find_t5_t6(L,t2,t3,t4,guess)
%This function finds t5,t6 for 'ONE' instance of t2,t3,t4.
%this function is used by solve_for_t5_t6()

%L=[O2A AC AB CB CD DO6 O2B O2O6];
O2A=L(1);
AC=L(2);
AB=L(3);
CB=L(4);
CD=L(5);
DO6=L(6);
O2B=L(7);
O2O6=L(8);

t5=guess(1);t6=guess(2);
D_t= -pinv([CD*cos(t5) -DO6*cos(t6); -CD*sin(t5) DO6*sin(t6)])*...
    [CD*sin(t5)-DO6*sin(t6)-O2B+CB*sin(t3);...
    CD*cos(t5)-DO6*cos(t6)-O2O6+O2A*cos(t2)+AC*cos(t4)];
guess=guess+D_t;

while (~(abs(D_t(1))< 0.00001 && abs(D_t(2))<0.00001))
    
    t5=guess(1);t6=guess(2);

    D_t= -pinv([CD*cos(t5) -DO6*cos(t6); -CD*sin(t5) DO6*sin(t6)])*...
    [CD*sin(t5)-DO6*sin(t6)-O2B+CB*sin(t3);...
    CD*cos(t5)-DO6*cos(t6)-O2O6+O2A*cos(t2)+AC*cos(t4)];
    guess=guess+D_t;

    
end
T=guess;
end