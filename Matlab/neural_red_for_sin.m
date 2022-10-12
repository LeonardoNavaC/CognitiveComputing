% Cargar solo 21 datos
load('salida27sept.mat')
load('entrada27sept.mat')

datosentrada(1) = entrada(1);
datossalida(1) = salida(1);

for i = 1:1000/50
    datosentrada(i+1) = entrada(i*50);
    datossalida(i+1) = salida(i*50);
end

m = 21;
syms w1 w2 w3 w4 w5 w6 b1 b2 b3 b4 x
yn = (w4/(1 + exp(-(w1*x + b1)))) + (w5/(1 + exp(-(w2*x + b2)))) + (w6/(1 + exp(-(w3*x + b3)))) + b4;

fo = 0;

for j = 1:m
    x = datosentrada(j);
    fo = fo + (datossalida(j) - subs(yn))^2;
end

alfa = 0.001;
e = 0.01;
n = 1;
gradiente = [diff(yn,w1);diff(yn,w2);diff(yn,w3);diff(yn,w4);diff(yn,w5);diff(yn,w6);diff(yn,b1);diff(yn,b2);diff(yn,b3);diff(yn,b4)]