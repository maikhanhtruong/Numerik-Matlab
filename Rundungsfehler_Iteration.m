%aufgabe2.4
a=9/10;
b=10;
c=0.01;
n=2000;

x=zeros(n,2);
x(1,:)=[c;c^2];
for i=1:n
    x(i+1,:)=[a^i*x(1,1);a^(2*i)*x(1,2)];
end

x_n=zeros(n,2);
x_n(1,:)=[c;c^2];
for i=1:n
    x_n(i+1,:)=[a*x_n(i,1);-(b-a^2)*x_n(i,1)^2+b*x_n(i,2)];
end

figure(1)
subplot(2,1,1)
plot(x(:,1),x(:,2),'b','LineWidth',2);
xlim([-abs(c) abs(c)])
title('Exakte Iteration')
xlabel('x_1')
ylabel('x_2')
subplot(2,1,2)
plot(x_n(:,1),x_n(:,2),'r','LineWidth',2);
xlim([-abs(c) abs(c)])
title('Numerische Interation')
xlabel('x_1')
ylabel('x_2')
z=zeros(n);
z_n=zeros(n);
for i=1:n
    z(i)=norm(x(i,:));
    z_n(i)=norm(xn(i,:));
end
iter=0:length(z)-1;

figure(2)
subplot(2,1,1)
loglog(iter, z,'b','LineWidth',2);
title('Exakte Iteration')
xlabel('Iterationen')
ylabel('Abstand zu (0,0)')
subplot(2,1,2)
loglog(iter, z_n,'r','LineWidth',2);
title('Numerische Interation')
xlabel('Iterationen')
ylabel('Abstand zu (0,0)')
figure
semilogy(iter(1:25),z_n(1:25),'r','LineWidth',2);
title('Numerische Interation')
xlabel('Iterationen')
ylabel('Abstand zu (0,0)')

