clear
clc
close all


t=[-1:0.00001:5];

step1=(t>=0);
step2=(t>=2);

h1=figure;
subplot(2,1,1)
plot(t, zeros(size(t)),'LineWidth',3);
hold on
quiver(0,0,0,1,'LineWidth',3,'color',[0, 0.4470, 0.7410])
ylim([-0.2 1.5])
xlim([-1 5])
ylabel("s_1(t)")
xlabel("t")
grid on
text(0.1, 1.25, 's_1(t)=\delta(t)','FontSize',12);


subplot(2,1,2)
plot(t, zeros(size(t)),'LineWidth',3);
hold on
quiver(2,0,0,1,'LineWidth',3,'color',[0, 0.4470, 0.7410])
ylim([-0.2 1.5])
xlim([-1 5])
ylabel("s_2(t)")
xlabel("t")
grid on
text(2.1, 1.25, 's_2(t)=\delta(t-2)','FontSize',12);

saveas(h1,"delta.png");
