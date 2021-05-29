%% SORU 2 - Y(f) CODE 
clc;
clear all;
close all;

fs=1000;        % �rnekleme frekans�
ts=1/fs;        % �rnekleme periyotu
t=0:ts:1-ts;    % zaman vekt�r�
 
mt = 10*cos(50*pi*t) + 20*cos(100*pi*t); %m(t) mesaj i�areti tan�m�
ct = 100*cos(500*pi*t); % c(t) ta��y�c� i�aret tan�m�
yt= mt .* ct; % ��k�� i�areti y(t) tan�m� 
 
freq_vector = -500:(fs/length(yt)):500-(fs/length(yt));% vekt�rler ayn� uzunlukta se�ilip d�n��t�r�len sinyalin frekans vekt�r�n� olu�tur.
fft_yt=(1/length(yt)) .* fft(yt);% d�n��t�r�len sinyalin aral���  
plot(freq_vector , abs (fftshift(fft_yt))); % Y(f) i�aretini �iz
 
title('F [ y(t) ] = Y(f) ','fontsize', [12]);
xlabel('frekans (Hz)');
ylabel('Genlik');
