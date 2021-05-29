%% SORU 3 - E(f) CODE
clc;
clear all;
close all;

fs=1000;        % �rnekleme frekans�
ts=1/fs;        % �rnekleme periyotu
t=0:ts:1-ts;    % zaman vekt�r�
 
mt = 10*cos(50*pi*t) + 20*cos(100*pi*t); %m(t) mesaj i�areti tan�m�
ct = 100*cos(500*pi*t); % c(t) ta��y�c� i�aret tan�m�
yt= mt .* ct; % ��k�� i�areti y(t) tan�m� 
et= yt .* cos(100*pi*t); % Demod�lat�r ��k�� i�areti e(t)
 
freq_vector = -500:(fs/length(et)):500-(fs/length(et));% vekt�rler ayn� uzunlukta se�ilip d�n��t�r�len sinyalin frekans vekt�r�n� olu�tur.
fft_et=(1/length(et)) .* fft(et);% d�n��t�r�len sinyalin aral���  
plot(freq_vector , abs (fftshift(fft_et))); % E(f) i�aretini �iz
 
title('F [ e(t) ] = E(f) ','fontsize', [12]);
xlabel('frekans (Hz)');
ylabel('Genlik');
