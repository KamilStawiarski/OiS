clear
clc
close all


t1=0:0.001:20;
s1=sin(2*pi*0.1*t1);

t2=0:1:20;
s2=sin(2*pi*0.1*t2);

h1=figure;
subplot(2,1,1)
plot(t1, s1,'LineWidth',3);
ylabel('s(t)')
xlabel('t')
subplot(2,1,2)
stem(t2, s2,'LineWidth',3);
ylabel('s[n]')
xlabel('n')

saveas(h1,"sim1.png");
