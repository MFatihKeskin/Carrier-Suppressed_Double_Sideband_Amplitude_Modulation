%% SORU 1 - M(f) CODE
clc;
clear all;
close all;

fs=1000;        % �rnekleme frekans�
ts=1/fs;        % �rnekleme periyotu
t=0:ts:1-ts;    % zaman vekt�r�
 
mt = 10*cos(50*pi*t) + 20*cos(100*pi*t); %m(t) mesaj i�areti tan�m�
freq_vector = -500:(fs/length(mt)):500-(fs/length(mt)); % vekt�rler ayn� uzunlukta se�ilip d�n��t�r�len sinyalin frekans vekt�r�n� olu�tur.
fft_mt = (1/length(mt)) .* fft(mt); % d�n��t�r�len sinyalin aral���  
plot (freq_vector , abs (fftshift (fft_mt)));  % M(f) i�aretini �iz
 
title('F [ m(t) ] = M(f) ','fontsize', [12]);
xlabel('frekans (Hz)');
ylabel('Genlik');
