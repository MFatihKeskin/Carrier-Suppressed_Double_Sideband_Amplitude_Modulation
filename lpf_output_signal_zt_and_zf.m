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
