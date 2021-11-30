function T1 = solve_for_t3_t4(L,T)
%for a given values of L,T this function solves and returns t3 and 
% t4 values
%for given L,t2 this function returns t3,t4.

%L=[O2A AC AB CB CD DO6 O2B O2O6];
O2A=L(1);
AC=L(2);
AB=L(3);
CB=L(4);
CD=L(5);
DO6=L(6);
O2B=L(7);
O2O6=L(8);
tB=22.3316450092*pi/180; %Angle at ABC in triangle (i.e angle at B)
t2=T(1,:);
t3=[];                   %stores t3 values for corresponding t2 values
t4=[];                   %stores t4 values for corresponding t2 values
for i=t2
    temp1=asin( (O2A*sin(i)+O2B)/AB ); %t3 value at a instant.
    temp2=asin( (CB*sin(temp1+tB)-O2A*sin(i)-O2B)/AC ); %t4 value at a instant.
    
    %temp is a temporary variable to store a value.

    t3=[t3 pi-tB-temp1];
    t4=[t4 temp2]; 

end


% %%************t3*************%%
% figure
% plot(t2*180/pi,t3*180/pi)
% xlabel('t2')
% ylabel('t3')
% title('Plot for \theta_3')
% grid on
% 
% %%***********t4*********%%
% figure 
% plot(t2*180/pi,t4*180/pi)
% xlabel('t2')
% ylabel('t4')
% title('Plot for \theta_4')
% grid on

T1=[t3;t4];
end