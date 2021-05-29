%% SORU 3 - E(f) CODE
clc;
clear all;
close all;

fs=1000;        % örnekleme frekansý
ts=1/fs;        % örnekleme periyotu
t=0:ts:1-ts;    % zaman vektörü
 
mt = 10*cos(50*pi*t) + 20*cos(100*pi*t); %m(t) mesaj iþareti tanýmý
ct = 100*cos(500*pi*t); % c(t) taþýyýcý iþaret tanýmý
yt= mt .* ct; % çýkýþ iþareti y(t) tanýmý 
et= yt .* cos(100*pi*t); % Demodülatör çýkýþ iþareti e(t)
 
freq_vector = -500:(fs/length(et)):500-(fs/length(et));% vektörler ayný uzunlukta seçilip dönüþtürülen sinyalin frekans vektörünü oluþtur.
fft_et=(1/length(et)) .* fft(et);% dönüþtürülen sinyalin aralýðý  
plot(freq_vector , abs (fftshift(fft_et))); % E(f) iþaretini çiz
 
title('F [ e(t) ] = E(f) ','fontsize', [12]);
xlabel('frekans (Hz)');
ylabel('Genlik');
