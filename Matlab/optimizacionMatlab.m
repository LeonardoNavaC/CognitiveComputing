load("theta.mat") % Entrada
load("thetad.mat") % Entrada
load("thetadd.mat") % Salida

datos_entrada1_theta(1) = theta(1);
datos_entrada2_theta_d(1) = thetad(1);
datos_salida_theta_2d(1) = thetadd(1);

for i = 1: 10000/500
   datos_entrada1_theta(i+1) = theta(1*50);
   datos_entrada2_theta_d(i+1) = theta_d(1*50);
   datos_salida_theta_2d(i+1) = theta_2d(i*50);
end  

syms w1 w2 w3 w4 w5 w6 w7 w8 w9 w10 w11 w12 w13 w14 w15 w16 w17 w18 w19 w20
syms w21 w22 w23 w24 w25 w26 w27 w28 w29 w30 w31 w32 w33 w34 w35 w36 w37 w38 w39 w40
syms w41 w42 w43 
syms b1 b2 b3 b4 b5 b6 b7 b8 b9 b10 b11 b12
syms theta thetad

n1=w1*theta+w2*thetad + b1;         n2=w3*theta+w4*thetad + b2;
n3=w5*theta+w6*thetad + b3;         n4=w7*theta+w8*thetad + b4;
n5=w9*theta+w10*thetad + b5;        n6=w11*theta+w12*thetad + b6;
n7=w13*theta+w14*thetad + b7;       n8=w15*theta+w16*thetad + b8;

sn1 = 1/(1+exp(-(n1))); sn2 = 1/(1+exp(-(n2))); sn3 = 1/(1+exp(-(n3))); sn4 = 1/(1+exp(-(n4)));  
sn5 = 1/(1+exp(-(n5))); sn6 = 1/(1+exp(-(n6))); sn7 = 1/(1+exp(-(n7))); sn8 = 1/(1+exp(-(n8))); 

beta1 = w20*sn1 + w21*sn2 + w22*sn3 + w23*sn4 + w24*sn5 + w25*sn6 +w26*sn7 + w27*sn8 +b10;
beta2 = w28*sn1 + w29*sn2 + w30*sn3 + w31*sn4 + w32*sn5 + w33*sn6 +w34*sn7 + w35*sn8 +b11;
beta3 = w36*sn1 + w37*sn2 + w38*sn3 + w39*sn4 + w40*sn5 + w41*sn6 +w42*sn7 + w43*sn8 +b12;

theta_2d_salida = ((w17/(1+exp(-(beta1))))...
          + (w18/(1+exp(-(beta2))))...
          + (w19/(1+exp(-(beta3)))) + b9);
      
fo = 0;
for i = 1:21
    theta = datos_entrada1_theta(i); thetad = datos_entrada2_theta_d(i);
    fo = fo  + (datos_salida_theta_2d(i) - subs(theta_2d_salida))^2;
end

alfa = 0.001; e = 0.01; n = 1;
gradiente=[diff(fo, w1),diff(fo, w2), diff(fo, w3), diff(fo, w4), diff(fo, w5), diff(fo, w6)...
            diff(fo, w7),diff(fo, w8), diff(fo, w9), diff(fo, w10), diff(fo, w11), diff(fo, w12)...
            diff(fo, w13),diff(fo, w14), diff(fo, w15), diff(fo, w16), diff(fo, w17), diff(fo, w18)...
            diff(fo, w19),diff(fo, w20), diff(fo, w21), diff(fo, w22), diff(fo, w23), diff(fo, w24)...
            diff(fo, w25),diff(fo, w26), diff(fo, w27), diff(fo, w28), diff(fo, w29), diff(fo, w30)...
            diff(fo, w31),diff(fo, w32), diff(fo, w33), diff(fo, w34), diff(fo, w35), diff(fo, w36)...
            diff(fo, w37),diff(fo, w38), diff(fo, w39), diff(fo, w40), diff(fo, w41), diff(fo, w42)...
            diff(fo, w43), diff(fo, b1), diff(fo, b2), diff(fo, b3), diff(fo, b4), diff(fo, b5), diff(fo, b6)...
           diff(fo, b7), diff(fo, b8), diff(fo, b9), diff(fo, b10), diff(fo, b11), diff(fo, b12)];

array_w_b = ones(1,55);


w1 = array_w_b(1);    w2 = array_w_b(2);    w3 = array_w_b(3);         w4 = array_w_b(4); 
w5 = array_w_b(5);    w6 = array_w_b(6);    w7 = array_w_b(7);         w8 = array_w_b(8);
w9 = array_w_b(9);    w10 = array_w_b(10);  w11 = array_w_b(11);       w12 = array_w_b(12); 
w13 = array_w_b(13);  w14 = array_w_b(14);  w15 = array_w_b(15);       w16 = array_w_b(16);
w17 = array_w_b(17);  w18 = array_w_b(18);  w19 = array_w_b(19);       w20 = array_w_b(20); 
w21 = array_w_b(21);  w22 = array_w_b(22);  w23 = array_w_b(23);       w24 = array_w_b(24);
w25 = array_w_b(25);  w26 = array_w_b(26);  w27 = array_w_b(27);       w28 = array_w_b(28); 
w29 = array_w_b(29);  w30 = array_w_b(30);  w31 = array_w_b(31);
w32 = array_w_b(32);       w33 = array_w_b(33);
w34 = array_w_b(34);  w35 = array_w_b(35);  w36 = array_w_b(36);       w37 = array_w_b(37); 
w38 = array_w_b(38);  w39 = array_w_b(39);  w40 = array_w_b(40);       w41 = array_w_b(41);
w42 = array_w_b(42);  w43 = array_w_b(43);  b1 = array_w_b(44);        b2 = array_w_b(45); 
b3 = array_w_b(46);   b4 = array_w_b(47);   b5 = array_w_b(48);        b6 = array_w_b(49);
b7 = array_w_b(50);   b8 = array_w_b(51);   b9 = array_w_b(52);        b10 = array_w_b(53);
b11 = array_w_b(54);  b12= array_w_b(55);