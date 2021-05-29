%% SORU 1 - M(f) CODE
clc;
clear all;
close all;

fs=1000;        % örnekleme frekansý
ts=1/fs;        % örnekleme periyotu
t=0:ts:1-ts;    % zaman vektörü
 
mt = 10*cos(50*pi*t) + 20*cos(100*pi*t); %m(t) mesaj iþareti tanýmý
freq_vector = -500:(fs/length(mt)):500-(fs/length(mt)); % vektörler ayný uzunlukta seçilip dönüþtürülen sinyalin frekans vektörünü oluþtur.
fft_mt = (1/length(mt)) .* fft(mt); % dönüþtürülen sinyalin aralýðý  
plot (freq_vector , abs (fftshift (fft_mt)));  % M(f) iþaretini çiz
 
title('F [ m(t) ] = M(f) ','fontsize', [12]);
xlabel('frekans (Hz)');
ylabel('Genlik');
