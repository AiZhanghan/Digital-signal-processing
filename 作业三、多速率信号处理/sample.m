clear;

x2 = sin(pi * 0.2 * (0: 1: 64 - 1)) + sin(pi * 0.4 * (0: 1: 64 - 1));

decimate_rate = 3;
h2 = sample_filter_gen(decimate_rate);
y2 = filter(h2, x2);
z2 = downsample(y2, decimate_rate);

z2_ = decimate(x2, decimate_rate);

figure(1);
subplot(4, 1, 1);
stem(x2, 'filled', 'MarkerSize', 3);
title('时域-原始信号');
subplot(4, 1, 2);
stem(y2, 'filled', 'MarkerSize', 3);
title('时域-通过抗混叠滤波器后的信号');
subplot(4, 1, 3);
stem(z2, 'filled', 'MarkerSize', 3);
title('时域-以采样因子为3进行采样后的信号');
subplot(4, 1, 4);
stem(z2_, 'filled', 'MarkerSize', 3);
title('时域-使用Matlab中decimate采样后的信号');

figure(2);
subplot(4, 1, 1);
stem(abs(fft(x2)), 'filled', 'MarkerSize', 3);
title('频域-原始信号');
subplot(4, 1, 2);
stem(abs(fft(y2)), 'filled', 'MarkerSize', 3);
title('频域-通过抗混叠滤波器后的信号');
subplot(4, 1, 3);
stem(abs(fft(z2)), 'filled', 'MarkerSize', 3);
title('频域-以采样因子为3进行采样后的信号');
subplot(4, 1, 4);
stem(abs(fft(z2_)), 'filled', 'MarkerSize', 3);
title('频域-使用Matlab中decimate采样后的信号');
