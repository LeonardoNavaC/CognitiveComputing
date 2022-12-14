%% 
clear all
load("theta.mat") % Entrada
load("thetad.mat") % Entrada
load("thetadd.mat") % Salida

datos_entrada1_theta(1) = theta(1);
datos_entrada2_theta_d(1) = thetad(1);
datos_salida_theta_2d(1) = theta_2d(1);

for i = 1: 1500/2
   datos_entrada1_theta(i+1) = theta(i*2);
   datos_entrada2_theta_d(i+1) = thetad(i*2);
   datos_salida_theta_2d(i+1) = theta_2d(i*2);
end  
%%
syms W1 W2 W3 W4 W5 W6 W7 W8 W9 W10 W11 W12 W13 W14 W15 W16 W17 W18 W19 W20 W21 W22 W23 W24 W25 W26 W27 W28 W29 W30 W31 W32 W33 W34 W35 W36 W37 W38 W39 W40 W41 W42 W43 
syms B1 B2 B3 B4 B5 B6 B7 B8 B9 B10 B11 B12
syms theta thetad

n1=W1*theta+W2*thetad + B1;         n2=W3*theta+W4*thetad + B2;
n3=W5*theta+W6*thetad + B3;         n4=W7*theta+W8*thetad + B4;
n5=W9*theta+W10*thetad + B5;        n6=W11*theta+W12*thetad + B6;
n7=W13*theta+W14*thetad + B7;       n8=W15*theta+W16*thetad + B8;

sn1 = 1/(1+exp(-(n1))); sn2 = 1/(1+exp(-(n2))); sn3 = 1/(1+exp(-(n3))); sn4 = 1/(1+exp(-(n4)));  
sn5 = 1/(1+exp(-(n5))); sn6 = 1/(1+exp(-(n6))); sn7 = 1/(1+exp(-(n7))); sn8 = 1/(1+exp(-(n8))); 

Beta1 = W20*sn1 + W21*sn2 + W22*sn3 + W23*sn4 + W24*sn5 + W25*sn6 +W26*sn7 + W27*sn8 +B10;
Beta2 = W28*sn1 + W29*sn2 + W30*sn3 + W31*sn4 + W32*sn5 + W33*sn6 +W34*sn7 + W35*sn8 +B11;
Beta3 = W36*sn1 + W37*sn2 + W38*sn3 + W39*sn4 + W40*sn5 + W41*sn6 +W42*sn7 + W43*sn8 +B12;

theta_2d_salida = ((W17/(1+exp(-(Beta1))))+ (W18/(1+exp(-(Beta2)))) + (W19/(1+exp(-(Beta3)))) + B9);
%%
fo = 0;
for i = 1:21
    theta = datos_entrada1_theta(i); thetad = datos_entrada2_theta_d(i);
    fo = fo  + (datos_salida_theta_2d(i) - subs(theta_2d_salida))^2;
end
disp(fo)
%%
alfa = 0.001; e = 0.01; n = 1;
gradiente = [diff(fo, W1),diff(fo, W2), diff(fo, W3), diff(fo, W4), diff(fo, W5), diff(fo, W6)...
            diff(fo, W7),diff(fo, W8), diff(fo, W9), diff(fo, W10), diff(fo, W11), diff(fo, W12)...
            diff(fo, W13),diff(fo, W14), diff(fo, W15), diff(fo, W16), diff(fo, W17), diff(fo, W18)...
            diff(fo, W19),diff(fo, W20), diff(fo, W21), diff(fo, W22), diff(fo, W23), diff(fo, W24)...
            diff(fo, W25),diff(fo, W26), diff(fo, W27), diff(fo, W28), diff(fo, W29), diff(fo, W30)...
            diff(fo, W31),diff(fo, W32), diff(fo, W33), diff(fo, W34), diff(fo, W35), diff(fo, W36)...
            diff(fo, W37),diff(fo, W38), diff(fo, W39), diff(fo, W40), diff(fo, W41), diff(fo, W42)...
            diff(fo, W43), diff(fo, B1), diff(fo, B2), diff(fo, B3), diff(fo, B4), diff(fo, B5), diff(fo, B6)...
            diff(fo, B7), diff(fo, B8), diff(fo, B9), diff(fo, B10), diff(fo, B11), diff(fo, B12)];
%%
array_W_B = zeros(1,55);


W1 = array_W_B(1);    W2 = array_W_B(2);    W3 = array_W_B(3);         W4 = array_W_B(4); 
W5 = array_W_B(5);    W6 = array_W_B(6);    W7 = array_W_B(7);         W8 = array_W_B(8);
W9 = array_W_B(9);    W10 = array_W_B(10);  W11 = array_W_B(11);       W12 = array_W_B(12); 
W13 = array_W_B(13);  W14 = array_W_B(14);  W15 = array_W_B(15);       W16 = array_W_B(16);
W17 = array_W_B(17);  W18 = array_W_B(18);  W19 = array_W_B(19);       W20 = array_W_B(20); 
W21 = array_W_B(21);  W22 = array_W_B(22);  W23 = array_W_B(23);       W24 = array_W_B(24);
W25 = array_W_B(25);  W26 = array_W_B(26);  W27 = array_W_B(27);       W28 = array_W_B(28); 
W29 = array_W_B(29);  W30 = array_W_B(30);  W31 = array_W_B(31);
W32 = array_W_B(32);  W33 = array_W_B(33);
W34 = array_W_B(34);  W35 = array_W_B(35);  W36 = array_W_B(36);       W37 = array_W_B(37); 
W38 = array_W_B(38);  W39 = array_W_B(39);  W40 = array_W_B(40);       W41 = array_W_B(41);
W42 = array_W_B(42);  W43 = array_W_B(43);  B1 = array_W_B(44);        B2 = array_W_B(45); 
B3 = array_W_B(46);   B4 = array_W_B(47);   B5 = array_W_B(48);        B6 = array_W_B(49);
B7 = array_W_B(50);   B8 = array_W_B(51);   B9 = array_W_B(52);        B10 = array_W_B(53);
B11 = array_W_B(54);  B12= array_W_B(55);

gradiente_numerico = vpa(subs(gradiente));
norma = norm(gradiente_numerico);
%%
while norma > e
    array_W_B = array_W_B - alfa * gradiente_numerico;
    W1 = array_W_B(1);    W2 = array_W_B(2);    W3 = array_W_B(3);         W4 = array_W_B(4); 
    W5 = array_W_B(5);    W6 = array_W_B(6);    W7 = array_W_B(7);         W8 = array_W_B(8);
    W9 = array_W_B(9);    W10 = array_W_B(10);  W11 = array_W_B(11);       W12 = array_W_B(12);     
    W13 = array_W_B(13);  W14 = array_W_B(14);  W15 = array_W_B(15);       W16 = array_W_B(16);
    W17 = array_W_B(17);  W18 = array_W_B(18);  W19 = array_W_B(19);       W20 = array_W_B(20); 
    W21 = array_W_B(21);  W22 = array_W_B(22);  W23 = array_W_B(23);       W24 = array_W_B(24);
    W25 = array_W_B(25);  W26 = array_W_B(26);  W27 = array_W_B(27);       W28 = array_W_B(28); 
    W29 = array_W_B(29);  W30 = array_W_B(31);  W32 = array_W_B(32);       W33 = array_W_B(33);
    W34 = array_W_B(34);  W35 = array_W_B(35);  W36 = array_W_B(36);       W37 = array_W_B(37); 
    W38 = array_W_B(38);  W39 = array_W_B(39);  W40 = array_W_B(40);       W41 = array_W_B(41);
    W42 = array_W_B(42);  W43 = array_W_B(43);  B1 = array_W_B(44);        B2 = array_W_B(45); 
    B3 = array_W_B(46);   B4 = array_W_B(47);   B5 = array_W_B(48);        B6 = array_W_B(49);
    B7 = array_W_B(50);   B8 = array_W_B(51);   B9 = array_W_B(52);        B10 = array_W_B(53);
    B11 = array_W_B(54);  B12= array_W_B(55);
    gradiente_numerico = vpa(subs(gradiente));
    norma = norm(gradiente_numerico);
    
end
disp(array_W_B)