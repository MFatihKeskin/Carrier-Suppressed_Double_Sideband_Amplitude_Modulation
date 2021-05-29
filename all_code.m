%% MUHAMMET FATIH KESKIN 171024093


%BU DOSYADA HER ÝÞARET ÝÇÝN YAZILAN KODLARIN BÝRLEÞÝMÝ VARDIR.

%HER SORU ÝÇÝN BÝR KOD PARÇASI YAZILMIÞTIR. BU NEDENLE HERHANGÝ BÝR
%ÝÞARETÝN ÇIKTISINI ELDE ETMEK ÝÇÝN DÝÐER TÜM SATIRLARI YORUM SATIRI
%YAPMAMIZ GEREKMEKTEDÝR. PROJE SORU SORU OLDUÐU ÝÇÝN BU ÞEKÝLDE BIRAKTIM.
%EÐER BUNU TERCÝH ETMÝYORSANIZ DÝÐER .m UZANTILI DOSYALARI TEK TEK 
%KONTROL ETMENÝZ GEREKMEKTEDÝR. 

%BU DOSYAYI DÝÐER DOSYALARI ÇALIÞTIRAMAZSANIZ BURADAN KONTROL
%EDEBÝLMENÝZ ÝÇÝN EKLEDÝM.



%% SORU1 - m(t) CODE 
clc;
clear all;
close all;

subplot(211),title('1 periyot boyunca m(t) iþareti', 'fontsize', [12]);
subplot(211),xlabel('t(zaman)');
subplot(211),ylabel('Genlik');
hold on; % önceki baþlýklarý sakla
subplot(211), fplot (@(t) 10*cos(50*pi*t)+20*cos(100*pi*t), [0 0.04]);
hold on; % önceki baþlýklarý sakla
subplot(212),fplot (@(t) 10*cos(50*pi*t)+20*cos(100*pi*t), [0 0.08]);
subplot(212),title('2 periyot boyunca m(t) iþareti', 'fontsize', [12]);
subplot(212),xlabel('t(zaman)');
subplot(212),ylabel('Genlik');



%% SORU 2 - y(t) CODE
clc;
clear all;
close all;

subplot(211),title('1 periyot boyunca y(t) iþareti', 'fontsize', [12]);
subplot(211),xlabel('t(zaman)');
subplot(211),ylabel('Genlik');
hold on;
subplot(211), fplot (@(t) (10*cos(50*pi*t)+20*cos(100*pi*t))*(100*cos(500*pi*t)), [0 0.04]);
hold on;
subplot(212),fplot (@(t) (10*cos(50*pi*t)+20*cos(100*pi*t))*(100*cos(500*pi*t)), [0 0.08]);
subplot(212),title('2 periyot boyunca y(t) iþareti', 'fontsize', [12]);
subplot(212),xlabel('t(zaman)');
subplot(212),ylabel('Genlik');



%% SORU 3 - e(t) CODE
clc;
clear all;
close all;

subplot(211),title('1 periyot boyunca e(t) iþareti', 'fontsize', [12]);
subplot(211),xlabel('t(zaman)');
subplot(211),ylabel('Genlik');
hold on;
subplot(211), fplot (@(t) (cos(100*pi*t))*(10*cos(50*pi*t)+20*cos(100*pi*t))*(100*cos(500*pi*t)), [0 0.04]);
subplot(212),title('2 periyot boyunca e(t) iþareti', 'fontsize', [12]);
subplot(212),xlabel('t(zaman)');
subplot(212),ylabel('Genlik');
hold on;
subplot(212), fplot (@(t) (cos(100*pi*t))*(10*cos(50*pi*t)+20*cos(100*pi*t))*(100*cos(500*pi*t)), [0 0.08]);



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



%% SORU 4 - Z(f) CODE
clc;
clear all;
close all;

fs=1000;       % örnekleme frekansý
ts=1/fs;        % örnekleme periyotu
t=-500:499;   % zaman vektörü transfer fonksiyonu ve e(f) uzunluðunu eþitlemek için 1000 boyutunda seçildi.
 
transfer_func = zeros (1,1000); % AGF transfer fonksiyonu için bir 0 matrisi oluþturuldu.  
%1000 boyutunda olmasýnýn sebebi e(f) ile çarpma yapabilmektir.
 
% Aþaðýdaki atamalar sayesinde sadece  BG{m(t)} = +-25 Hz arasý genliði 1 yapýldý
% Harici bir atama yapýlmadýðý sürece -25ten küçük olan kýsýmlar ve +25ten
% büyük olan kýsýmlar 0 genlikli olacaktýr. Bu sayede AGF giriþi e(f)
% sinyalini bu transfer fonksiyonu ile çarptýðýmýzda z(f) çýkýþýný elde edeceðiz.
for i = 476:525
    transfer_func(1,i) = 1;
end

subplot(311); plot (t,transfer_func);
title('Alçak Geçiren Filtre Transfer Fonkisyonu','fontsize', [12]);
xlabel('frekans (Hz)');
ylabel('Genlik');
hold on;
 
mt = 10*cos(50*pi*t) + 20*cos(100*pi*t);%m(t) mesaj iþareti tanýmý
ct = 100*cos(500*pi*t); % c(t) taþýyýcý iþaret tanýmý
yt= mt .* ct; % modülasyon çýkýþ iþareti y(t) tanýmý 
et= yt .* cos(100*pi*t); % Demodülatör çýkýþ iþareti e(t)
 
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
title('z(t) çýkýþ iþareti','fontsize', [12]);
xlabel('frekans (Hz)');
ylabel('Genlik');
hold on;


%%