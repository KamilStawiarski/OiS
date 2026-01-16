clear
clc
close all

x=[-3e-3:1e-6:3e-3];
f=1e3;

fx=sign(sin(2*pi*f*x));

Nset=[1:30];
a=@(n)0.*n;
b=@(n)2*(1-(-1).^n)./(pi*n);

h=@(f)(1000/(j*f+1000));

figure
subplot(2,1,1)
plot(x,fx, "linewidth", 2)
xlim([min(x) max(x)]);
ylim([-1.5 1.5]);
grid on
ylabel('f(t)');
xlabel('t [ms]');
set(gca, "linewidth", 2, "fontsize", 12);
subplot(2,1,2)
stem(Nset, b(Nset), "linewidth", 2, "filled");
grid on
ylabel('b(n)');
xlabel('n');
set(gca, "linewidth", 2, "fontsize", 12);

fx1=zeros(size(x));
fxf=zeros(size(x));

N=1000;
for n=1:N
    fx1=fx1+b(n)*sin(2*pi*f*n*x);
    fxf=fxf+b(n)*abs(h(n*f))*sin(2*pi*f*n*x+arg(h(n*f)));
end


figure
subplot(2,1,1)
plot(x,fx1, "linewidth", 2)
xlim([min(x) max(x)]);
ylim([-1.5 1.5]);
grid on
ylabel('f(t)');
xlabel('t [ms]');
set(gca, "linewidth", 2, "fontsize", 12);
subplot(2,1,2)
plot(x,fxf, "linewidth", 2)
xlim([min(x) max(x)]);
ylim([-1.5 1.5]);
grid on
ylabel('f_{filtered}(t)');
xlabel('t [ms]');
set(gca, "linewidth", 2, "fontsize", 12);

