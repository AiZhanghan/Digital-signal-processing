function Hd = sample_filter_gen(r)

N = 20;
Fc = 1 / r;
flag = 'scale';

win = rectwin(N + 1);

b = fir1(N, Fc, 'low', win, flag);
Hd = dfilt.dffir(b);
end

