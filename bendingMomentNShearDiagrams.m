
%Gabriel Bisco, Noah, and Anthony
%Group 15

%reaction forces gear-by-gear case:
%KN
R1= [3.581062693 0.446273338 0.790629582 0.753541152 0.844722362 0.296129686];
R2= [0.767370577 2.082608911 0.954916248 0.623899663 0.313364747 0.798262632];
%gear distance (mm) (order: 154362)
D= [30 46 93 77 140 124];
Gear = [1 5 4 3 6 2]
%radial loads(KN)
Fr = [4.34843327 2.528882249 1.74554583 1.377440815 1.158087109 1.094392318];
%shaft length (mm)
L=170;

x=linspace(0,170); 

for i = 1:6
V=R1(i)*(x>0)- Fr(i)*(x>D(i))+ R2(i)*(x>170);
M=R1(i)*x- Fr(i)*(x-D(i)).*(x>D(i));
subplot(211)
plot(x,V);
title('Distance V. Shear')
xlabel('x (mm)')
ylabel('V (KN)')

if i==6
    legend("Gear:"+string(Gear(1)),"Gear:"+string(Gear(2)),"Gear:"+string(Gear(3)),"Gear:"+string(Gear(4)),"Gear:"+string(Gear(5)),"Gear:"+string(Gear(6)))
end

hold on
subplot(212)
plot(x,M);
title('Distance V. Bending')
xlabel('x (mm)')
ylabel('M (KN*mm)')

if i==6
    legend("Gear:"+string(Gear(1)),"Gear:"+string(Gear(2)),"Gear:"+string(Gear(3)),"Gear:"+string(Gear(4)),"Gear:"+string(Gear(5)),"Gear:"+string(Gear(6)))
end

hold on
end

