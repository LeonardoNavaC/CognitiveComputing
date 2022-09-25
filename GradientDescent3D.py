# Leonardo Javier Nava Castellanos A01750595
# Eva Denisse Vargas Sosa A01377098 
# Actividad: ----Descenso del gradiente en tres dimensiones----- 
# fecha 21 de Septiembre del 2021 
# Computo cognitivo :D

import numpy as np
import math as m

def gradientD(w1,w2,B):
	a1 = 2.1**2
	a2 = 2.1
	a3 = 6**2
	a4 = 6
	a5 = 9.1**2
	a6 = 9.1
	a7 = 7.5**2
	a8 = 7.5
	result_value = np.array([float( 2*w1*(a1**2 + a3**2 + a5**2 + a7**2) + 2*w2*(a1*a2 + a3*a4 + a5*a6 + a7*a8) + 2*B*(a1 + a3 + a5 + a7) + (-17.8*a1 - 2.4*a3 - 31.4*a5 - 13*a7))
							,float( 2*w1*(a1*a2 + a3*a4 + a5*a6 + a7*a8) + 2*w2*(a2**2 + a4**2 + a6**2 + a8**2) + 2*B*(a2 + a4 + a6 + a8) + (-17.8*a2 - 2.4*a4 - 31.4*a6 - 13*a8))
							,float( 2*w1*(a1 + a3 + a5 + a7) + 2*w2*(a2 + a4 + a6 + a8) + 8*B -64.6)])

	return result_value

def sqrt1(vector):
	gresult = m.sqrt(vector[0]**2 + vector[1]**2 + vector[2]**2)
	return gresult


def main():
	epsilon = 0.01
	alpha = 0.00005

	w1,w2, B = 1, 0, 1
	x = np.array([w1,w2,B])
	k = 1

	while (sqrt1(gradientD(x[0],x[1],x[2])) > epsilon):
		print(gradientD(x[0],x[1],x[2]))
		x = x - alpha*gradientD(x[0],x[1],x[2])
		k += 1
		
	xresult = x
	kresult = k
	print("---- The minimum is: ", xresult, "at",k,"iteration -----")

if __name__ == '__main__':
	main()


