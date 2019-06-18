clear;

a = 1;
b = 2;
f1 = 60;
f2 = 300;
snr = 4;
fs = 1000;
N = 400;
y = awgn(a * sin(2 * pi * f1 / fs * (0: 1: N - 1)) + ...
        b * cos(2 * pi * f2 / fs * (0: 1: N - 1)), snr, 'measured');
   
P1 = abs(fft(y, N)).^2 / N^2;

P2 = periodogram(y, [], N, 'power', 'twosided');

figure(1);
subplot(2, 1, 1);
plot(0: N - 1, P1);
title('周期图法谱估计结果');
subplot(2, 1, 2);
plot(0: length(P2) - 1, P2);
title('Matlab中periodogram谱估计结果')
    