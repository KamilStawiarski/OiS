clear
clc
close all

x=[-3:0.001:3];
T=1;

fx=sign(sin(2*pi*x));

figure
plot(x,fx, "linewidth", 2)
xlim([min(x) max(x)]);
ylim([-1.5 1.5]);
grid on
ylabel('f(x)');
xlabel('x');
set(gca, "linewidth", 2, "fontsize", 18);

a=@(n)0.*n;
b=@(n)2*(1-(-1).^n)./(pi*n);

Nset=[1:30];

figure
subplot(2,1,1)
stem(Nset, a(Nset), "linewidth", 2, "filled");
grid on
ylabel('a(n)');
xlabel('n');
set(gca, "linewidth", 2, "fontsize", 12);
subplot(2,1,2)
stem(Nset, b(Nset), "linewidth", 2, "filled");
grid on
ylabel('b(n)');
xlabel('n');
set(gca, "linewidth", 2, "fontsize", 12);



N=[3 10 20 10000];
fx1=zeros(length(N),length(fx));

figure
for plotIdx=1:length(N)
    for n=1:N(plotIdx)
        fx1(plotIdx,:)=fx1(plotIdx,:)+b(n)*sin(2*pi*1*n*x);
    end

    subplot(2,2,plotIdx)
    titleString=['N=' num2str(N(plotIdx))];
    plot(x,fx, "linewidth", 2)
    hold on
    plot(x,fx1(plotIdx,:), "linewidth", 1)
    title(titleString, "fontsize", 8);
    xlim([min(x) max(x)]);
    ylim([-1.5 1.5]);
    grid on
    ylabel('f(x)');
    xlabel('x');
    set(gca, "linewidth", 2, "fontsize", 12);
end
