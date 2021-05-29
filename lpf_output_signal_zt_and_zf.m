%% SORU 4 - Z(f) CODE
clc;
clear all;
close all;

fs=1000;       % �rnekleme frekans�
ts=1/fs;        % �rnekleme periyotu
t=-500:499;   % zaman vekt�r� transfer fonksiyonu ve e(f) uzunlu�unu e�itlemek i�in 1000 boyutunda se�ildi.
 
transfer_func = zeros (1,1000); % AGF transfer fonksiyonu i�in bir 0 matrisi olu�turuldu.  
%1000 boyutunda olmas�n�n sebebi e(f) ile �arpma yapabilmektir.
 
% A�a��daki atamalar sayesinde sadece  BG{m(t)} = +-25 Hz aras� genli�i 1 yap�ld�
% Harici bir atama yap�lmad��� s�rece -25ten k���k olan k�s�mlar ve +25ten
% b�y�k olan k�s�mlar 0 genlikli olacakt�r. Bu sayede AGF giri�i e(f)
% sinyalini bu transfer fonksiyonu ile �arpt���m�zda z(f) ��k���n� elde edece�iz.
for i = 476:525
    transfer_func(1,i) = 1;
end

subplot(311); plot (t,transfer_func);
title('Al�ak Ge�iren Filtre Transfer Fonkisyonu','fontsize', [12]);
xlabel('frekans (Hz)');
ylabel('Genlik');
hold on;
 
mt = 10*cos(50*pi*t) + 20*cos(100*pi*t);%m(t) mesaj i�areti tan�m�
ct = 100*cos(500*pi*t); % c(t) ta��y�c� i�aret tan�m�
yt= mt .* ct; % mod�lasyon ��k�� i�areti y(t) tan�m� 
et= yt .* cos(100*pi*t); % Demod�lat�r ��k�� i�areti e(t)
 
freq_vector = -500:(fs/length(et)):500-(fs/length(et));
fft_et=(1/length(et)) .* fft(et); % E(f) elde edildi
 

zf = fft_et .* transfer_func; %z(f) = e(f) * AGF transfer fonksiyonu
zt = ifftshift(ifft(zf)); %z(f) ->TersFouirer-> z(t)
 
subplot(312); plot (t,zf);
title('F [ z(t) ] = Z(f) ','fontsize', [12]);
xlabel('frekans (Hz)');
ylabel('Genlik');
hold on;
 
subplot(313); plot (t,zt);
title('z(t) ��k�� i�areti','fontsize', [12]);
xlabel('frekans (Hz)');
ylabel('Genlik');
hold on;
