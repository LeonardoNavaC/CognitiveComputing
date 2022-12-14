clear all
load("theta.mat") % Entrada
load("thetad.mat") % Entrada
load("thetadd.mat") % Salida

datos_entrada1_theta = theta(1:800);
datos_entrada2_theta_d = thetad(1:800);
entradaEntrenamiento = [datos_entrada1_theta,datos_entrada2_theta_d];
salidaEntrenamiento = theta_2d(1:800);

red = fitnet([8,3]);

red.inputs{1}.size = 2;
red.layers{1}.transferFcn='logsig';
red.layers{2}.transferFcn='logsig';

view(red)

[red,tr] = train(red,entradaEntrenamiento.',salidaEntrenamiento.');