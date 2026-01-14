clear
clc
close all

t=0:0.0001:10;

a=2;
t1=2;
t2=3;
t3=4;

s1=a/t1.*t.*step(t) ...
-a/t1.*(t-t1).*step(t-t1) ...
-a/(t3-t2).*(t-t2).*step(t-t2) ...
+a/(t3-t2).*(t-t3).*step(t-t3);

sd1=a/t1.*step(t)-a/t1.*step(t-t1)-a/(t3-t2).*step(t-t2)+a/(t3-t2).*step(t-t3);

yL=min(s1)-0.2;
yH=max(s1)+0.2;

h1=figure;
subplot(2,1,1)
plot(t, s1,'LineWidth',3);
ylabel("s_1(t)")
xlabel("t")
grid on
strLabel={['s_1(t)=' num2str(a/t1) 't\bf1\rm(t)-' num2str(a/t1) '(t-2)\bf1\rm(t-2)'],['-' num2str(a/(t3-t2)) '(t-3)\bf1\rm(t-3)+' num2str(a/(t3-t2)) '(t-4)\bf1\rm(t-4)']};
text(4.1, 1.5, strLabel,'FontSize',12);
ylim([yL yH])


subplot(2,1,2)
plot(t, sd1,'LineWidth',3);
ylabel("s`_1(t)")
xlabel("t")
grid on
strLabel=['s`_1(t)=' num2str(a/t1) '\bf1\rm(t)-' num2str(a/t1) '\bf1\rm(t-2)-' num2str(a/(t3-t2)) '\bf1\rm(t-3)+' num2str(a/(t3-t2)) '\bf1\rm(t-4)'];
text(4.1, 0.5, strLabel,'FontSize',12);
ylim([min(sd1)-0.2 max(sd1)+0.2])
xlim([min(t) max(t)])

saveas(h1,"ex2.png");
