function Hd = min_max_approximation_filter
%MIN_MAX_APPROXIMATION_FILTER Returns a discrete-time filter object.

% MATLAB Code
% Generated by MATLAB(R) 9.6 and DSP System Toolbox 9.8.
% Generated on: 17-Jun-2019 16:42:27

% Equiripple Lowpass filter designed using the FIRPM function.

% All frequency values are in Hz.
Fs = 1000;  % Sampling Frequency

Fpass = 120;             % Passband Frequency
Fstop = 180;             % Stopband Frequency
Dpass = 0.057501127785;  % Passband Ripple
Dstop = 0.079432823472;  % Stopband Attenuation
dens  = 20;              % Density Factor

% Calculate the order from the parameters using FIRPMORD.
[N, Fo, Ao, W] = firpmord([Fpass, Fstop]/(Fs/2), [1 0], [Dpass, Dstop]);

% Calculate the coefficients using the FIRPM function.
b  = firpm(N, Fo, Ao, W, {dens});
Hd = dfilt.dffir(b);

% [EOF]
