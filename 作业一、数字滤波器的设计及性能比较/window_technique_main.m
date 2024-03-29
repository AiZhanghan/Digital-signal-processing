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

out2 = filter(window_technique_filter, y);

figure;
subplot(3, 2, 1);
plot(0: N - 1, y, '-');
title('ʱ��-�˲�ǰ�ź�');
subplot(3, 2, 2);
plot(0: N - 1, out2, '-');
title('ʱ��-�˲����ź�');
subplot(3, 2, 3);
plot(0: N - 1, abs(fft(y)));
title('Ƶ��-�˲�ǰ�ź�-����');
subplot(3, 2, 4);
plot(0: N - 1, abs(fft(out2)));
title('Ƶ��-�˲����ź�-����');
subplot(3, 2, 5);
plot(0: N - 1, angle(fft(y)));
title('Ƶ��-�˲�ǰ�ź�-��λ');
subplot(3, 2, 6);
plot(0: N - 1, angle(fft(out2)));
title('Ƶ��-�˲����ź�-��λ');