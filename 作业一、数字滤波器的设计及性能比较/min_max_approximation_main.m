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

out3 = filter(min_max_approximation_filter, y);

figure;
subplot(3, 2, 1);
plot(0: N - 1, y, '-');
title('时域-滤波前信号');
subplot(3, 2, 2);
plot(0: N - 1, out3, '-');
title('时域-滤波后信号');
subplot(3, 2, 3);
plot(0: N - 1, abs(fft(y)));
title('频域-滤波前信号-幅度');
subplot(3, 2, 4);
plot(0: N - 1, abs(fft(out3)));
title('频域-滤波后信号-幅度');
subplot(3, 2, 5);
plot(0: N - 1, angle(fft(y)));
title('频域-滤波前信号-相位');
subplot(3, 2, 6);
plot(0: N - 1, angle(fft(out3)));
title('频域-滤波后信号-相位');