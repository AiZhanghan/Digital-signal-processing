clear;

a = 1;
b = 0.7;
f1 = 100;
f2 = 200;
mean = 0;
var = 2.5;
fs = 1000;
N = 200;
y = a * sin(2 * pi * f1 / fs * (0: 1: N - 1)) + ...
    b * cos(2 * pi * f2 / fs * (0: 1: N - 1)) + ...
    normrnd(mean, sqrt(var));

fc = 150;
wc = 2 * pi * fc / fs;
NN = 10;
N_freq_sample_fir = 100;
M = fix(wc * (NN  - 1) / pi) + 1;
f = linspace(0, 1, NN);
a = [ones(1, M) zeros(1, NN - M)];
FIR1 = fir2(N_freq_sample_fir, f, a);

out1 = filter(FIR1, 1, y);

figure;
subplot(3, 2, 1);
plot(0: N - 1, y, '-');
title('ʱ��-�˲�ǰ�ź�');
subplot(3, 2, 2);
plot(0: N - 1, out1, '-');
title('ʱ��-�˲����ź�');
subplot(3, 2, 3);
plot(0: N - 1, abs(fft(y)));
title('Ƶ��-�˲�ǰ�ź�-����');
subplot(3, 2, 4);
plot(0: N - 1, abs(fft(out1)));
title('Ƶ��-�˲����ź�-����');
subplot(3, 2, 5);
plot(0: N - 1, angle(fft(y)));
title('Ƶ��-�˲�ǰ�ź�-��λ');
subplot(3, 2, 6);
plot(0: N - 1, angle(fft(out1)));
title('Ƶ��-�˲����ź�-��λ');
