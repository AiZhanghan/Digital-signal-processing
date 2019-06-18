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

Wp = 2 * pi * 120;
Ws = 2 * pi * 180;
Rp = 1;
Rs = 25;
[n, Wn] = buttord(Wp, Ws, Rp, Rs, 's');
[z, p, k] = buttap(n);
[bp, ap] = zp2tf(z, p, k);
[bs, as] = lp2lp(bp, ap, Wn);
[bz, az] = bilinear(bs, as, fs);

figure(1);
freqz(bz, az);
title('��ͨ�˲��������׺���λ������');

out5 = filter(bz, az, y);

figure(2);
subplot(3, 2, 1);
plot(0: N - 1, y, '-');
title('ʱ��-�˲�ǰ�ź�');
subplot(3, 2, 2);
plot(0: N - 1, out5, '-');
title('ʱ��-�˲����ź�');
subplot(3, 2, 3);
plot(0: N - 1, abs(fft(y)));
title('Ƶ��-�˲�ǰ�ź�-����');
subplot(3, 2, 4);
plot(0: N - 1, abs(fft(out5)));
title('Ƶ��-�˲����ź�-����');
subplot(3, 2, 5);
plot(0: N - 1, angle(fft(y)));
title('Ƶ��-�˲�ǰ�ź�-��λ');
subplot(3, 2, 6);
plot(0: N - 1, angle(fft(out5)));
title('Ƶ��-�˲����ź�-��λ');
