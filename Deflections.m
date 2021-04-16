%Gabriel Bisco, Noah, and Anthony
%Group 15

%valid for homogeneous shaft with same diameter

%reaction forces gear-by-gear case: (for reference)
%KN
R1= [3.581062693 0.446273338 0.790629582 0.753541152 0.844722362 0.296129686];
R2= [0.767370577 2.082608911 0.954916248 0.623899663 0.313364747 0.798262632];
%shaft length (m)
L=170;
%gear distance (m) (order: 154362)
D= [30 140 93 77 46 124];
%case less 170/2 B = 170-D(n) otherwise D(n)
B= [L-D(1) D(2) D(3) L-D(4) L-D(5) D(6)];
%case less 170/2 A = D(n) otherwise A= 170-D(n)
A= [D(1) L-D(2) L-D(3) D(4) D(5) L-D(6)];
%Check C should be = L
C=[A(1)+B(1) A(2)+B(2) A(3)+B(3) A(4)+B(4) A(5)+B(5) A(6)+B(6)];
for i=1:6
    if ~(C(i)==L)
        disp('Problem calculating A and B distances!')
    end
end
Gear = [1 5 4 3 6 2];
%radial loads(KN)
Fr = [4.34843327 2.528882249 1.74554583 1.377440815 1.158087109 1.094392318];

%get diameter and Modulus of elasticity E
d=input('Shaft Diameter (mm):')
E=input('Modulus of Elasticity(GPa):')
E=E*10^6;

%moment of inertia
I=(pi*d^4)/64;

x=linspace(0,170);

yline(0)
hold on;

%Y=Fr/(6EIL) *[Bx(x^2+B^2-L^2)-L<x-A>^3]
for j=1:6
   nu = Fr(j)/(6*E*I*L);
   y=nu * (B(j).*x.*(x.^2+ B(j).^2 - L^2) -L.*((x-A(j)).^3).*(x>A(j)));
   plot(x,y)
   title('Distance V. Deflection')
   xlabel('x (mm)')
   ylabel('y (mm)')
   if j==6
    legend("original state","Gear:"+string(Gear(1)),"Gear:"+string(Gear(2)),"Gear:"+string(Gear(3)),"Gear:"+string(Gear(4)),"Gear:"+string(Gear(5)),"Gear:"+string(Gear(6)))
   end
   hold on;
end


