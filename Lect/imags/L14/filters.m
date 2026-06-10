clear
clc
close all

LinToDB=@(x)(20*log10(abs(x)));
f=10.^[0:0.01:6];
ybounds=[-65 5];
fg=1e3;

## wykresy 4 filtrow
H1ideal=@(x)(fg./(j*x+fg));
H2ideal=@(x)(j*x./(j*x+fg));
H3ideal=@(x)(j*x*fg./(j*x+fg).^2);
H4ideal=@(x)((j*x).^2+fg^2)./((j*x).^2+(fg/1).*j.*x+fg^2);

## ---------- RYSOWANIE ----------

% kolory w formacie RGB
c1 = [0.00 0.45 0.74];
c2 = [0.85 0.33 0.10];
c3 = [0.47 0.67 0.19];
c4 = [0.49 0.18 0.56];
cr = [0.80 0.00 0.00];

figure();
set(gcf,'position',[100 100 900 600]);  % większe okno

% --- H1 ---
subplot(2,2,1)
h1 = semilogx(f, LinToDB(H1ideal(f)), 'linewidth', 2);
hold on
semilogx([fg fg], ybounds, 'r--', 'linewidth', 1.2);
grid on
grid minor
ylim(ybounds)
xlim([min(f) max(f)])
xlabel('Częstotliwość [Hz]', 'fontsize', 11)
ylabel('|H_1(j\omega)| [dB]', 'fontsize', 11)
title('Filtr dolnoprzepustowy', 'fontsize', 12)
set(gca,'fontsize',10,'linewidth',1)  % grubsze osie i większe cyfry

% --- H2 ---
subplot(2,2,2)
h2 = semilogx(f, LinToDB(H2ideal(f)), 'linewidth', 2);
hold on
semilogx([fg fg], ybounds, 'r--', 'linewidth', 1.2);
grid on
grid minor
ylim(ybounds)
xlim([min(f) max(f)])
xlabel('Częstotliwość [Hz]', 'fontsize', 11)
ylabel('|H_2(j\omega)| [dB]', 'fontsize', 11)
title('Filtr górnoprzepustowy', 'fontsize', 12)
set(gca,'fontsize',10,'linewidth',1)

% --- H3 ---
subplot(2,2,3)
h3 = semilogx(f, LinToDB(H3ideal(f)), 'linewidth', 2);
hold on
semilogx([fg fg], ybounds, 'r--', 'linewidth', 1.2);
grid on
grid minor
ylim(ybounds)
xlim([min(f) max(f)])
xlabel('Częstotliwość [Hz]', 'fontsize', 11)
ylabel('|H_3(j\omega)| [dB]', 'fontsize', 11)
title('Filtr pasmowo przepustowy', 'fontsize', 12)
set(gca,'fontsize',10,'linewidth',1)

% --- H4 ---
subplot(2,2,4)
h4 = semilogx(f, LinToDB(H4ideal(f)), 'linewidth', 2);
hold on
semilogx([fg fg], ybounds, 'r--', 'linewidth', 1.2);
grid on
grid minor
ylim(ybounds)
xlim([min(f) max(f)])
xlabel('Częstotliwość [Hz]', 'fontsize', 11)
ylabel('|H_4(j\omega)| [dB]', 'fontsize', 11)
title('Filtr pasmowo zaporowy', 'fontsize', 12)
set(gca,'fontsize',10,'linewidth',1)

% opcjonalny wspólny tytuł figury (Octave udaje sgtitle)
axes('position',[0 0 1 1],'visible','off');
text(0.5,0.98,'Charakterystyki amplitudowe filtrów idealnych', ...
     'horizontalalignment','center', ...
     'fontsize',13, 'fontweight','bold');

print('-dpng', '-r300', 'filters.png');

