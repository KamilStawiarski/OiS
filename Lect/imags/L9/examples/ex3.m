clear
clc
close all

t=0:0.0001:10;

s1=step(t-1)+step(t-2)-step(t-3)-step(t-4)-step(t-5)-step(t-6);
s2=0.5.*t.*step(t)-step(t-2)-step(t-4)-1.*(t-4).*step(t-4)+step(t-6)+0.5.*(t-8).*step(t-8)+step(t-8);

sd4=step(t-1)+step(t-2)-step(t-3)-step(t-4)-2*step(t-5)+2*step(t-7);

h1=figure;
subplot(2,2,1)
plot(t, s1,'LineWidth',3);
ylabel("s_1(t)")
xlabel("t")
grid on
ylim([min(s1)-0.2 max(s1)+0.2])

subplot(2,2,2)
plot(t, s2,'LineWidth',3);
ylabel("s_2(t)")
xlabel("t")
grid on
ylim([min(s2)-0.2 max(s2)+0.2])

subplot(2,2,3)
plot(t, zeros(size(t)),'LineWidth',3);
hold on
quiver(1,0,0,1,'LineWidth',3,'color',[0, 0.4470, 0.7410])
plot([2 2],[0 -1],'LineWidth',3,'color',[0, 0.4470, 0.7410])
quiver(2,-1,0,-1,'LineWidth',3,'color',[0, 0.4470, 0.7410])
plot([3 3],[0 2],'LineWidth',3,'color',[0, 0.4470, 0.7410])
quiver(3,2,0,1,'LineWidth',3,'color',[0, 0.4470, 0.7410])
plot([4 4],[0 -3],'LineWidth',3,'color',[0, 0.4470, 0.7410])
quiver(4,-3,0,-1,'LineWidth',3,'color',[0, 0.4470, 0.7410])
ylabel("s`_3(t)")
xlabel("t")
grid on
ylim([-4.5 3.5])
xlim([min(t) max(t)])

subplot(2,2,4)
plot(t, sd4,'LineWidth',3);
ylabel("s`_4(t)")
xlabel("t")
grid on
ylim([-2.2 2.2])
xlim([min(t) max(t)])


saveas(h1,"ex3.png");
