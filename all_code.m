%% MUHAMMET FATIH KESKIN 171024093


%BU DOSYADA HER ��ARET ���N YAZILAN KODLARIN B�RLE��M� VARDIR.

%HER SORU ���N B�R KOD PAR�ASI YAZILMI�TIR. BU NEDENLE HERHANG� B�R
%��ARET�N �IKTISINI ELDE ETMEK ���N D��ER T�M SATIRLARI YORUM SATIRI
%YAPMAMIZ GEREKMEKTED�R. PROJE SORU SORU OLDU�U ���N BU �EK�LDE BIRAKTIM.
%E�ER BUNU TERC�H ETM�YORSANIZ D��ER .m UZANTILI DOSYALARI TEK TEK 
%KONTROL ETMEN�Z GEREKMEKTED�R. 

%BU DOSYAYI D��ER DOSYALARI �ALI�TIRAMAZSANIZ BURADAN KONTROL
%EDEB�LMEN�Z ���N EKLED�M.



%% SORU1 - m(t) CODE 
clc;
clear all;
close all;

subplot(211),title('1 periyot boyunca m(t) i�areti', 'fontsize', [12]);
subplot(211),xlabel('t(zaman)');
subplot(211),ylabel('Genlik');
hold on; % �nceki ba�l�klar� sakla
subplot(211), fplot (@(t) 10*cos(50*pi*t)+20*cos(100*pi*t), [0 0.04]);
hold on; % �nceki ba�l�klar� sakla
subplot(212),fplot (@(t) 10*cos(50*pi*t)+20*cos(100*pi*t), [0 0.08]);
subplot(212),title('2 periyot boyunca m(t) i�areti', 'fontsize', [12]);
subplot(212),xlabel('t(zaman)');
subplot(212),ylabel('Genlik');



%% SORU 2 - y(t) CODE
clc;
clear all;
close all;

subplot(211),title('1 periyot boyunca y(t) i�areti', 'fontsize', [12]);
subplot(211),xlabel('t(zaman)');
subplot(211),ylabel('Genlik');
hold on;
subplot(211), fplot (@(t) (10*cos(50*pi*t)+20*cos(100*pi*t))*(100*cos(500*pi*t)), [0 0.04]);
hold on;
subplot(212),fplot (@(t) (10*cos(50*pi*t)+20*cos(100*pi*t))*(100*cos(500*pi*t)), [0 0.08]);
subplot(212),title('2 periyot boyunca y(t) i�areti', 'fontsize', [12]);
subplot(212),xlabel('t(zaman)');
subplot(212),ylabel('Genlik');



%% SORU 3 - e(t) CODE
clc;
clear all;
close all;

subplot(211),title('1 periyot boyunca e(t) i�areti', 'fontsize', [12]);
subplot(211),xlabel('t(zaman)');
subplot(211),ylabel('Genlik');
hold on;
subplot(211), fplot (@(t) (cos(100*pi*t))*(10*cos(50*pi*t)+20*cos(100*pi*t))*(100*cos(500*pi*t)), [0 0.04]);
subplot(212),title('2 periyot boyunca e(t) i�areti', 'fontsize', [12]);
subplot(212),xlabel('t(zaman)');
subplot(212),ylabel('Genlik');
hold on;
subplot(212), fplot (@(t) (cos(100*pi*t))*(10*cos(50*pi*t)+20*cos(100*pi*t))*(100*cos(500*pi*t)), [0 0.08]);



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


%%