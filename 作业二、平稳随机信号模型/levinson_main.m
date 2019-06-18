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
    
order = 4;

r_ = xcorr(y, 'biased');
r = r_(length(y): length(y) + order);

[a, e] = levinson(r, order);
P3 = a*r'./(abs(1+a(2:order+1)*(exp(-sqrt(-1)*2*pi/N*(1:order)'*(0:N-1)))).^2)/N;

P4 = 2*pi*pyulear(y, order, N, 'twosided')'/N;

figure;
subplot(2, 1, 1);
plot(0: N - 1, P3);
title('AR(4)谱估计结果');
subplot(2, 1, 2);
plot(0: N - 1, P4);
title('Matlab中pyulear谱估计结果');