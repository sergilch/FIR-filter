clear 'all';

x = audioread('source.wav');

Fs = 44100;                % Sampling Frequency

Fpass = 500;               % Passband Frequency
Fstop = 600;               % Stopband Frequency
Dpass = 0.057501127785;    % Passband Ripple
Dstop = 3.1622776602e-06;  % Stopband Attenuation
dens  = 20;                % Density Factor

% Calculate the order from the parameters using FIRPMORD.
[N, Fo, Ao, W] = firpmord([Fpass, Fstop]/(Fs/2), [1 0], [Dpass, Dstop]);

% Calculate the coefficients using the FIRPM function.
b  = firpm(N, Fo, Ao, W, {dens});
Hd = dfilt.dffir(b);

y = filter(Hd, x);

audiowrite('destination_lp.wav', y, 44100);




clear 'all';




x = audioread('source.wav');

Fs = 44100;                % Sampling Frequency

Fstop = 500;               % Stopband Frequency
Fpass = 600;               % Passband Frequency
Dstop = 3.1622776602e-06;  % Stopband Attenuation
Dpass = 0.057501127785;    % Passband Ripple
dens  = 20;                % Density Factor

% Calculate the order from the parameters using FIRPMORD.
[N, Fo, Ao, W] = firpmord([Fstop, Fpass]/(Fs/2), [0 1], [Dstop, Dpass]);


% Calculate the coefficients using the FIRPM function.
b  = firpm(N, Fo, Ao, W, {dens});
Hd = dfilt.dffir(b);


y = filter(Hd, x);

audiowrite('destination_hp.wav', y, 44100);




clear 'all';




x = audioread('source.wav');

Fs = 44100;                % Sampling Frequency

Fstop1 = 300;               % First Stopband Frequency
Fpass1 = 400;               % First Passband Frequency
Fpass2 = 3200;              % Second Passband Frequency
Fstop2 = 3300;              % Second Stopband Frequency
Dstop1 = 3.1622776602e-06;  % First Stopband Attenuation
Dpass  = 0.057501127785;    % Passband Ripple
Dstop2 = 3.1622776602e-06;  % Second Stopband Attenuation
dens   = 20;                % Density Factor

% Calculate the order from the parameters using FIRPMORD.
[N, Fo, Ao, W] = firpmord([Fstop1 Fpass1 Fpass2 Fstop2]/(Fs/2), [0 1 ...
                          0], [Dstop1 Dpass Dstop2]);

% Calculate the coefficients using the FIRPM function.
b  = firpm(N, Fo, Ao, W, {dens});
Hd = dfilt.dffir(b);


y = filter(Hd, x);

audiowrite('destination_bp.wav', y, 44100);



clear 'all';
