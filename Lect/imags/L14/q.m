clear
clc
close all

LinToDB=@(x)(20*log10(abs(x)));
f=10.^[0:0.0001:6];
w = 2*pi*f;
fg=1e3;
w0 = 2*pi*fg;
j = 1i;

xlimits = [1e1 1e5];
ylimits = [-50 5];

Qvec = [0.1 1 10 100];
c = [0.00 0.45 0.74];

Hbp = @(w,Q) ((w0./Q).*j.*w) ./ ( (j.*w).^2 + (w0./Q).*j.*w + w0^2 );

figure();
set(gcf,'position',[100 100 950 650]);

for k = 1:4
  Q = Qvec(k);

  H = Hbp(w,Q);
  magDB = LinToDB(H);

  [maxval, idx0] = max(magDB);
  level3 = maxval - 3;

  idx_left = idx0;
  while idx_left > 1 && magDB(idx_left) > level3
    idx_left = idx_left - 1;
  endwhile

  idx_right = idx0;
  while idx_right < numel(f) && magDB(idx_right) > level3
    idx_right = idx_right + 1;
  endwhile

  % interpolacja liniowa dla f1
  fL1 = f(idx_left);
  fL2 = f(idx_left + 1);
  yL1 = magDB(idx_left);
  yL2 = magDB(idx_left + 1);
  f1 = fL1 + (level3 - yL1) * (fL2 - fL1) / (yL2 - yL1);

  % interpolacja liniowa dla f2
  fR1 = f(idx_right - 1);
  fR2 = f(idx_right);
  yR1 = magDB(idx_right - 1);
  yR2 = magDB(idx_right);
  f2 = fR1 + (level3 - yR1) * (fR2 - fR1) / (yR2 - yR1);

  bw = f2 - f1;

  subplot(2,2,k)
  semilogx(f, magDB, 'linewidth', 2, 'color', c);
  hold on

  % pozioma linia -3 dB tylko w obszarze pasma
  semilogx([f1 f2], [level3 level3], 'k--', 'linewidth', 1.8);

  % znaczniki krańcow pasma
  semilogx([f1 f1], [level3-4 level3+2], 'k-', 'linewidth', 1.5);
  semilogx([f2 f2], [level3-4 level3+2], 'k-', 'linewidth', 1.5);

  % punkty przeciecia
  semilogx(f1, level3, 'ko', 'markersize', 5, 'markerfacecolor', 'k');
  semilogx(f2, level3, 'ko', 'markersize', 5, 'markerfacecolor', 'k');

  % podpis pasma
  text_pos_f = sqrt(f1*f2);
  text_pos_y = level3 - 8;

  text(text_pos_f, text_pos_y, ...
       sprintf('Pasmo 3 dB = %.2f Hz', bw), ...
       'horizontalalignment','center', ...
       'fontsize',12, ...
       'fontweight','bold', ...
       'backgroundcolor',[1 1 1]);

  grid on
  grid minor
  ylim(ylimits)
  xlim(xlimits)
  xlabel('Częstotliwość [Hz]', 'fontsize', 11)
  ylabel('|H_{BP}(j\\omega)| [dB]', 'fontsize', 11)
  title(sprintf('Filtr pasmowo-przepustowy, Q = %g', Q), 'fontsize', 12)
  set(gca,'fontsize',10,'linewidth',1)
endfor

axes('position',[0 0 1 1],'visible','off');
text(0.5,0.98,'Charakterystyki |H_{BP}(j\\omega)| dla róznych Q', ...
     'horizontalalignment','center', ...
     'fontsize',13, 'fontweight','bold');

print('-dpng', '-r300', 'bandpass_filters.png');
