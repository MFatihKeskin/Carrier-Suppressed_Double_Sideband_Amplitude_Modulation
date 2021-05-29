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


