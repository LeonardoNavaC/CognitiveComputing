clear all
%Data fitting
%funcion objetivo
%fx=(8.9-a*2.1^2-2.1*b-c)^2+(1.2-a*6^2-6*b-c)^2+(15.7-a*9.1^2-9.1*b-c)^2+(6.5-a*7.5^2-7.5*b-c)^2;


%------------Con fminunc MatLab-------

%x=[w1;w2;b] variables de diseño, no quitar comentario
fun=@(x) (8.9-(x(1)*2.1^2+x(2)*2.1+x(3)))^2+(1.2-(x(1)*6^2+x(2)*6+x(3)))^2+(15.7-(x(1)*9.1^2+x(2)*9.1+x(3)))^2+(6.5-(x(1)*7.5^2+x(2)*7.5+x(3)))^2;
x0=[1,1,2];
[x,fval,exitflag,output,grad,hessian]=fminunc(fun,x0);
%----------------------------------



%Descenso de gradiente
%inicializa

m=1;
a=1; %w1
b=1; %w2
c=2; %c=b
e=0.000000001;
alfa=0.00006;
%gradiente se calculó fuera de este código 
gx=[(113370067*a)/5000 + (1400707*b)/500 + (17947*c)/50 - 1748191/500;
    (1400707*a)/500 + (17947*b)/50 + (247*c)/5 - 21751/50;
    (17947*a)/50 + (247*b)/5 + 8*c - 323/5];


norma=sqrt(gx(1)^2+gx(2)^2+gx(3)^2); %norm(gx)

while norma>e
  m=m+1;
  a=a-alfa*gx(1);
  b=b-alfa*gx(2);
  c=c-alfa*gx(3);
 
  gx=[(113370067*a)/5000 + (1400707*b)/500 + (17947*c)/50 - 1748191/500;
    (1400707*a)/500 + (17947*b)/50 + (247*c)/5 - 21751/50;
    (17947*a)/50 + (247*b)/5 + 8*c - 323/5];
  norma=sqrt(gx(1)^2+gx(2)^2+gx(3)^2);
  
  
end
fx=(8.9-a*2.1^2-2.1*b-c)^2+(1.2-a*6^2-6*b-c)^2+(15.7-a*9.1^2-9.1*b-c)^2+(6.5-a*7.5^2-7.5*b-c)^2;
disp('pesos')
disp(a)
disp(b)
disp(c)
disp('norma o gradiente')
disp(norma)
disp('función objetivo o performance o error')
disp(fx)


%graficar la curva resultado y las medidas
x = 0:10/1000:10;
y=a*x.^2+b*x+c;

plot(x,y);
hold on
plot(2.1,8.9,'-o');
plot(6,1.2,'-o');
plot(9.1,15.7,'-o');
plot(7.5,6.5,'-o');
