S = load('laughter.mat', 'y');

sound(S.y, 8 * 1024);

i = 3;
d = 2;
t = upsample(S.y, i);
h = sample_filter_gen(max(i, d));
p = filter(h, t);
y = downsample(p, d);

sound(2 * y, 12 * 1024);

figure;
subplot(2, 1, 1);
stem(abs(fft(S.y)), 'filled', 'MarkerSize', 3);
title('频域-给定采样频率为8kHZ的语音信号');
subplot(2, 1, 2);
stem(abs(fft(y)), 'filled', 'MarkerSize', 3);
title('频域-转换采样频率为12kHZ的语音信号');
