clear;
clc;
#Leer el valor a
ok = false;
while (~ok)
  try
    Px=input("Ingrese el vector P(x)=");
    ok = true;
  catch
    printf("Por favor, ingrese un numero v�lido.\n\n"); % Try catch para asegurarnos que ingreso un valor valido
  end_try_catch
endwhile

#Leer el valor a
ok = false;
while (~ok)
  try
    Py_dado_x=input("La matriz P(x|y) = ");
    ok = true;
  catch
    printf("Por favor, ingrese un numero v�lido.\n\n"); % Try catch para asegurarnos que ingreso un valor valido
  end_try_catch
endwhile

%MOSTRAMOS LOS VALORES INGRESADOS 

  %Mostramos P(x)
  disp("El valor de P(x) es ")
  disp(Px)
  disp("\n")
  
  %Mostramos P(y|x)
  disp("El valor de P(y|x) es ")
  disp(Py_dado_x)
  disp("\n")
  

% CALCULAMOS LAS PROBABILIDADES

  % Calculamos P(y)
  Py = Px * Py_dado_x;
  disp("El valor de P(y) es ")
  disp(Py)
  disp("\n")
  

  % Calculamos P(x,y)
  Pxy = diag(Px) * Py_dado_x;
  disp("El valor de P(x,y) es ")
  disp(Pxy)
  disp("\n")

%CALCULAMOS LAS ENTROPIAS

  %Calculamos H(x)
  Hx = Entropia(Px,Px);
  disp(["El valor de H(x) es ", num2str(Hx),"\n"])

  %Calculamos H(y|x)
  Hy_dado_x = Entropia(Pxy,Py_dado_x);
  disp(["El valor de H(y|x) es ", num2str(Hy_dado_x),"\n"])

  %Calculamos H(y)
  Hy = Entropia(Py,Py);
  disp(["El valor de H(y) es ", num2str(Hy),"\n"])

  %Calculamos H(x,y)
  Hxy = Entropia(Pxy,Pxy);
  disp(["El valor de H(x,y) es ", num2str(Hxy),"\n"])

%CALCULAMOS LA GANANCIA DE INFORMACION

  Ixy = Hy - Hy_dado_x;
  disp(["El valor de I(x,y) es ", num2str(Ixy),"\n"])

%CALCULAMOS CS

  %Comprobamos si es un canal simetrico binario
  Sim_bin = IsSimetry(Py_dado_x);
  
  %Si es simetrico calculamos Cs
  % Analizando la formula notamos que -H(y|x) = P*log2(P) + (P-1)*log2( (P-1) )
  if Sim_bin
    Cs = 1 + (-Hy_dado_x);
    disp(["El canal es simetrico binario. \nEl valo de Cs ", num2str(Cs)])
  else
    disp("El canal no es simetrico binario")
  endif

  
  


