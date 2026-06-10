clear
clc
close all

% wektor czestotliwosci 20 Hz – 20 kHz
f = logspace(log10(20), log10(20000), 5000);

SPL0 = 85;   % poziom odniesienia w pasmie przenoszenia

% parametry „odcięć”
f_hp = 200;    % okolice odcięcia od dołu (HPF-owo)
f_lp = 5000;   % okolice odcięcia od góry (LPF-owo)

% LAGODNE SPADKI (ciągłe, bez if-ów)
% dół: zachowanie jak filtr górnoprzepustowy pierwszego rzędu
hp_shape = -20*log10( sqrt(1 + (f_hp./f).^2) );
% góra: zachowanie jak filtr dolnoprzepustowy pierwszego rzędu
lp_shape = -20*log10( sqrt(1 + (f./f_lp).^2) );

% środkowe, delikatne falowanie (mała amplituda, działa wszędzie)
mid_wiggle1 = 1.2 * sin(2*pi*log10(f/300));
mid_wiggle2 = 0.8 * sin(4*pi*log10(f/1500));
mid_wiggle  = mid_wiggle1 + mid_wiggle2;

% suma – wynik jest ciągły dla wszystkich f
SPL = SPL0 + hp_shape + lp_shape + mid_wiggle;

% rysowanie
figure();
set(gcf,'position',[100 100 900 450]);

semilogx(f, SPL, 'linewidth', 2.2, 'color', [0.00 0.45 0.74]);
grid on
grid minor
xlim([20 20000]);
ylim([60 95]);

xlabel('Częstotliwość [Hz]', 'fontsize', 11)
ylabel('Poziom ciśnienia akustycznego [dB SPL]', 'fontsize', 11)
title('Charakterystyka przenoszenia głośnika średniotonowego', 'fontsize', 13)
set(gca,'fontsize',10,'linewidth',1)

% ticki jak na „plakietkach”
xticks = [20 50 100 200 500 1000 2000 5000 10000 20000];
xticklabels = {'20','50','100','200','500','1k','2k','5k','10k','20k'};
set(gca, 'XTick', xticks, 'XTickLabel', xticklabels);

print('-dpng', '-r300', 'glosnik.png');
