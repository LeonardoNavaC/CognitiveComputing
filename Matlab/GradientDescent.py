# Leonardo Javier Nava Castellanos A01750595
# Eva Denisse Vargas Sosa A01377098 
# Actividad: ----Descenso del gradiente en una sola dimension----- 
# fecha 21 de Septiembre del 2021 
# Computo cognitivo :D

def gradientD(value):
	result_value = 3*((value)**2) - 9*value
	return result_value

def main():
	epsilon = 0.0001
	alpha = 0.001
	x = 1
	k = 1 

	while (abs(gradientD(x)) > epsilon):
		x = x - alpha*gradientD(x)
		k += 1

	xresult = x
	kresult = k
	print("---- The minimum is: ", xresult, "at",k,"iteration -----")

if __name__ == '__main__':
	main()


