%Clase 4 de octubre
clear all
load('datos4oct.mat');
entradaentrenamiento=entrada(1:1500);
salidaentrenaniemto=salida(1:1500);
red=fitnet([48,48,48]);
view(red)
red.layers{1}.transferFcn='logsig';
red.layers{2}.transferFcn='logsig';
[red,tr]=train(red,entradaentrenamiento.',salidaentrenaniemto.');

nntraintool
gensim(red)

%clase 27 de septiembre
% load('clase27sep.mat');
% %netconf=[x y z ];
% %net =feedforwardnet(betconf)
% 
% red = fitnet([8,3]);
% view(red)
% red.layers{1}.transferFcn='logsig';
% [red,tr]=train(red,entrada.',salida.');
% nntraintool