function Hd = equiripple (Fs, Fpass, Fstop, N) 
%MIN_MAX_APPROXIMATION_FILTER Returns a discrete-time filter object.

% MATLAB Code
% Generated by MATLAB(R) 9.6 and DSP System Toolbox 9.8.
% Generated on: 17-Jun-2019 16:42:27

% Equiripple Lowpass filter designed using the FIRPM function.

% All frequency values are in Hz.

Wpass = 1;             % Passband Frequency
Wstop = 1;             % Stopband Frequency
dens  = 20;              % Density Factor

% Calculate the coefficients using the FIRPM function.
b  = firpm(N, [0 Fpass Fstop Fs / 2] / (Fs / 2), [1 1 0 0], ...
            [Wpass Wstop], {dens});
Hd = dfilt.dffir(b);
end