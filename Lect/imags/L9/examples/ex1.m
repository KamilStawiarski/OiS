clear
clc
close all

t=0:0.0001:10;

s1=step(t-1)+step(t-2)-3*step(t-3)+step(t-4);


yL=min(s1)-0.2;
yH=max(s1)+0.2;

h1=figure;
subplot(2,1,1)
plot(t, s1,'LineWidth',3);
ylabel("s_1(t)")
xlabel("t")
grid on
text(4.1, 1.25, 's_1(t)=\bf1\rm(t-1)+\bf1\rm(t-2)-3\bf1\rm(t-3)+\bf1\rm(t-4)','FontSize',12);
ylim([yL yH])


subplot(2,1,2)
plot(t, zeros(size(t)),'LineWidth',3);
hold on
quiver(1,0,0,1,'LineWidth',3,'color',[0, 0.4470, 0.7410])
quiver(2,0,0,1,'LineWidth',3,'color',[0, 0.4470, 0.7410])
plot([3 3],[0 -2],'LineWidth',3,'color',[0, 0.4470, 0.7410])
quiver(3,-2,0,-1,'LineWidth',3,'color',[0, 0.4470, 0.7410])
quiver(4,0,0,1,'LineWidth',3,'color',[0, 0.4470, 0.7410])
ylabel("s`_1(t)")
xlabel("t")
grid on
text(4.1, 0.25, 's`_1(t)=\delta(t-1)+\delta(t-2)-3\delta(t-3)+\delta(t-4)','FontSize',12);
ylim([-3.1 1.1])
xlim([min(t) max(t)])

saveas(h1,"ex1.png");
