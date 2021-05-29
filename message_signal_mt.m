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
