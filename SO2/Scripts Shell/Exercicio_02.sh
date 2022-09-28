:' Sistemas Operacionais - Laboratório.
- Exiba o seguinte menu de opções:
--------------------------------
CALCULADORA
Selecione a operação aritmética:
A = ADIÇÃO
S = SUBTRAÇÃO
M = MULTIPLICAÇÃO
D = DIVISÃO
Z = ENCERRAR
Resultado acumulado = nnn
-------------------------------
00 - Desenvolva o seguinte algoritmo:
01 - Sempre que for exibir o menu, limpe a tela;
02 - Se não for digitada uma opção válida, dar um aviso e voltar a exibir o menu de opções;
03 - O script só deverá ser encerrado quando for digitado a opção "Z";
04 - Após o usuário digitar uma opção válida, solicitar separadamente cada um dos operandos da operação a ser executada;
05 - Executar a operação e exibir o resultado no formato: "RESULTADO = nnn";
06 - Executar a operação e verificar se o resultado é um número par ou ímpar. Em seguida exibir a mensagem no formato: "RESULTADO nnn EH UM NUMERO PAR/IMPAR";
07 - Após  exibir o resultado da última opção selecionada, solicitar um <ENTER> ao usuário e voltar a exibir o menu de opções;
08 - A cada operação realizada acumular o resultado e exibir esse total na linha "Resultado acumulado" no final do menu de opções.
'
clear

AuxWhile=0
Resultado=0

while test AuxWhile=0
do

	clear

	echo "CALCULADORA"
	echo "Selecione a operacao aritmetica:"
	echo "A = ADICAO"
	echo "S = SUBTRACAO"
	echo "M = MULTIPLICACAO"
	echo "D = DIVISAO"

	echo "Z = ENCERRAR"
	echo "Resultado acumulado = $Resultado"

	read Operacao
	case $Operacao in
	"Z") break;;
	esac
	
	read NumUm
	read NumDois

	case $Operacao in
		"A") Soma=`expr $NumUm + $NumDois`
				echo "Resultado = $Soma"
				Resultado=`expr $Resultado + $Soma`
				TesteImparPar=`expr $Soma % 2`
					if test $TesteImparPar -eq 0
					then
						echo "RESULTADO EH PAR"
					else
						echo "RESULTADO EH IMPAR"
					fi;;

		"S") Subtracao=`expr $NumUm - $NumDois`
				echo "Resultado = $Subtracao"
				Resultado=`expr $Resultado + $Subtracao`
				TesteImparPar=`expr $Subtracao % 2`
					if test $TesteImparPar -eq 0
					then
						echo "RESULTADO EH PAR"
					else
						echo "RESULTADO EH IMPAR"
					fi;;

		"M") Multip=`expr $NumUm \* $NumDois`
				echo "Resultado = $Multip"
				Resultado=`expr $Resultado + $Multip`
				TesteImparPar=`expr $Multip % 2`
					if test $TesteImparPar -eq 0
					then
						echo "RESULTADO EH PAR"
					else
						echo "RESULTADO EH IMPAR"
					fi;;

		"D") Divisao=`expr $NumUm / $NumDois`
				echo "Resultado = $Divisao"
				Resultado=`expr $Resultado + $Divisao`
				TesteImparPar=`expr $Divisao % 2`
					if test $TesteImparPar -eq 0
					then
						echo "RESULTADO EH PAR"
					else
						echo "RESULTADO EH IMPAR"
					fi;;
					
		*) echo "Operação invalida. Digite novamente uma opção valida.";;
	esac
	
	TesteImparPar=`expr $Resultado % 2`
	
	case $TesteImparPar in
		0) echo "O RESULTADO ACUMULADO EH PAR";;
		
		1) echo "O RESULTADO ACUMULADO EH IMPAR";;
	esac
	
	echo "DIGITE A TECLA <ENTER> PARA CONTINUAR"
	read enter
	
done