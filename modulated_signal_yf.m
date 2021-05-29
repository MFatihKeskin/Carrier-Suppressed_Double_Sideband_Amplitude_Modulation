%% SORU 2 - Y(f) CODE 
clc;
clear all;
close all;

fs=1000;        % örnekleme frekansý
ts=1/fs;        % örnekleme periyotu
t=0:ts:1-ts;    % zaman vektörü
 
mt = 10*cos(50*pi*t) + 20*cos(100*pi*t); %m(t) mesaj iþareti tanýmý
ct = 100*cos(500*pi*t); % c(t) taþýyýcý iþaret tanýmý
yt= mt .* ct; % çýkýþ iþareti y(t) tanýmý 
 
freq_vector = -500:(fs/length(yt)):500-(fs/length(yt));% vektörler ayný uzunlukta seçilip dönüþtürülen sinyalin frekans vektörünü oluþtur.
fft_yt=(1/length(yt)) .* fft(yt);% dönüþtürülen sinyalin aralýðý  
plot(freq_vector , abs (fftshift(fft_yt))); % Y(f) iþaretini çiz
 
title('F [ y(t) ] = Y(f) ','fontsize', [12]);
xlabel('frekans (Hz)');
ylabel('Genlik');
