clear;

x1 = sin(pi * 0.25 * (0: 1: 64 - 1));

interp_rate = 3;
y1 = upsample(x1, interp_rate);
h1 = sample_filter_gen(interp_rate);
z1 = filter(h1, y1);

z1_ = interp(x1, interp_rate);

figure(1);
subplot(4, 1, 1);
stem(x1, 'filled', 'MarkerSize', 3);
title('ʱ��-ԭʼ�ź�');
subplot(4, 1, 2);
stem(y1, 'filled', 'MarkerSize', 3);
title('ʱ��-���ڲ�����Ϊ3�����ڲ����ź�');
subplot(4, 1, 3);
stem(z1, 'filled', 'MarkerSize', 3);
title('ʱ��-ͨ���������˲�������ź�');
subplot(4, 1, 4);
stem(z1_, 'filled', 'MarkerSize', 3);
title('ʱ��-ʹ��Matlab��interp�ڲ����ź�');

figure(2);
subplot(4, 1, 1);
stem(abs(fft(x1)), 'filled', 'MarkerSize', 3);
title('Ƶ��-ԭʼ�ź�');
subplot(4, 1, 2);
stem(abs(fft(y1)), 'filled', 'MarkerSize', 3);
title('Ƶ��-���ڲ�����Ϊ3�����ڲ����ź�');
subplot(4, 1, 3);
stem(abs(fft(z1)), 'filled', 'MarkerSize', 3);
title('Ƶ��-ͨ���������˲�������ź�');
subplot(4, 1, 4);
stem(abs(fft(z1_)), 'filled', 'MarkerSize', 3);
title('Ƶ��-ʹ��Matlab��interp�ڲ����ź�');
