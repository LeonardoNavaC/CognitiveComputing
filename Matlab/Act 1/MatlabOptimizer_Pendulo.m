clear all
fun=@funcion;

x0 = ones(1,55);

[x,fval,exitflag,output,grad,hessian]=fminunc(fun,x0);

disp(fval)
disp(x)


function [fun] =funcion(X)
    
    fun=0;
    
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
    
    w1 = X(1);    w2 = X(2);    w3 = X(3);         w4 = X(4); 
    w5 = X(5);    w6 = X(6);    w7 = X(7);         w8 = X(8);
    w9 = X(9);    w10 = X(10);  w11 = X(11);       w12 = X(12); 
    w13 = X(13);  w14 = X(14);  w15 = X(15);       w16 = X(16);
    w17 = X(17);  w18 = X(18);  w19 = X(19);       w20 = X(20); 
    w21 = X(21);  w22 = X(22);  w23 = X(23);       w24 = X(24);
    w25 = X(25);  w26 = X(26);  w27 = X(27);       w28 = X(28); 
    w29 = X(29);  w30 = X(30);  w31 = X(31);       w32 = X(32);
    w33 = X(33);  w34 = X(34);  w35 = X(35);       w36 = X(36);       
    w37 = X(37);  w38 = X(38);  w39 = X(39);       w40 = X(40);
    w41 = X(41);  w42 = X(42);  w43 = X(43);
    b1 = X(44);   b2 = X(45);   b3 = X(46);   b4 = X(47);
    b5 = X(48);   b6 = X(49);   b7 = X(50);   b8 = X(51);   
    b9 = X(52);   b10 = X(53);  b11 = X(54);  b12= X(55);
    

    fo = 0;
    for i = 1:301
        theta = datos_entrada1_theta(i); thetad = datos_entrada2_theta_d(i);

        n1=w1*theta+w2*thetad + b1;         n2=w3*theta+w4*thetad + b2;
        n3=w5*theta+w6*thetad + b3;         n4=w7*theta+w8*thetad + b4;
        n5=w9*theta+w10*thetad + b5;        n6=w11*theta+w12*thetad + b6;
        n7=w13*theta+w14*thetad + b7;       n8=w15*theta+w16*thetad + b8;
        
        sn1 = 1/(1+exp(-(n1))); sn2 = 1/(1+exp(-(n2))); sn3 = 1/(1+exp(-(n3))); sn4 = 1/(1+exp(-(n4)));  
        sn5 = 1/(1+exp(-(n5))); sn6 = 1/(1+exp(-(n6))); sn7 = 1/(1+exp(-(n7))); sn8 = 1/(1+exp(-(n8))); 
        
        beta1 = w20*sn1 + w21*sn2 + w22*sn3 + w23*sn4 + w24*sn5 + w25*sn6 +w26*sn7 + w27*sn8 +b10;
        beta2 = w28*sn1 + w29*sn2 + w30*sn3 + w31*sn4 + w32*sn5 + w33*sn6 +w34*sn7 + w35*sn8 +b11;
        beta3 = w36*sn1 + w37*sn2 + w38*sn3 + w39*sn4 + w40*sn5 + w41*sn6 +w42*sn7 + w43*sn8 +b12;
        
        theta_2d_salida = ((w17/(1+exp(-(beta1))))+ (w18/(1+exp(-(beta2)))) + (w19/(1+exp(-(beta3)))) + b9);
        fo = fo  + (datos_salida_theta_2d(i) - theta_2d_salida)^2;
    end
    fun = fo;

end