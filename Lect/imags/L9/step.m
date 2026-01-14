clear
clc
close all


t=[-1:0.00001:5];

step1=(t>=0);
step2=(t>=2);

h1=figure;
subplot(2,1,1)
plot(t,step1,'LineWidth',3);
ylim([-0.2 1.5])
ylabel("s_1(t)")
xlabel("t")
grid on
text(0.1, 1.25, 's_1(t)=\bf1\rm(t)','FontSize',12);


subplot(2,1,2)
plot(t,step2,'LineWidth',3);
ylim([-0.2 1.5])
ylabel("s_2(t)")
xlabel("t")
grid on
text(2.1, 1.25, 's_2(t)=\bf1\rm(t-2)','FontSize',12);

saveas(h1,"step.png");
