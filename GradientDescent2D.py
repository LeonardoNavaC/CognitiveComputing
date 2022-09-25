# Leonardo Javier Nava Castellanos A01750595
# Eva Denisse Vargas Sosa A01377098 
# Actividad: ----Descenso del gradiente en dos dimensiones----- 
# fecha 21 de Septiembre del 2021 
# Computo cognitivo :D

import numpy as np
import math as m

def gradientD(w, b):
	result_value = np.array([(8*b + 20*w - 104) ,(4*b+8*w-44)])
	return result_value

def sqrt1(vector):
	gresult = m.sqrt(vector[0]**2 + vector[1]**2)
	return gresult


def main():
	epsilon = 0.0001
	alpha = 0.05

	w, b = 2, 1
	x = np.array([w, b])
	k = 1

	while (sqrt1(gradientD(x[0],x[1])) > epsilon):
		x = x - alpha*gradientD(x[0],x[1])
		k += 1
		
	xresult = x
	kresult = k
	print("---- The minimum is: ", xresult, "at",k,"iteration -----")

if __name__ == '__main__':
	main()


