:'Sistemas Operacionais - Prova 01 - Script Shell
- Exiba o seguinte menu de opções:
--------------------------------
Nome do aluno: Gustavo Rocha Maia.
Selecione uma opção:
1 = Calcular o perimetro de um retangulo;
2 = Listar um diretório;
3 = Criar um diretório;
9 = Encerrar Script.
--------------------------------
00 - Desenvolva o seguinte algoritmo:

01 - Sempre limpar a tela antes de exibir o menu inicial.

02 - Se foi digitado "1":
		- Solicitar ao usuário o tamanho da altura de um retangulo;
		- Solicitar ao usuário o tamanho da largura de um retangulo;
		- Calcular o perimetro do retangulo;
		- Se o perimetro for menor que 70, exibir a mensagem "Resultado menor que o esperado = NNN";
		- Se o perimetro nao for menor que 70, exibir a mensagem "Resultado maior que o esperado = NNN".
		
03 - Se foi digitado "2":
		- Solicitar ao usuário um nome de diretório (o caminho deve será fornecido junto).
		- Verificar se o diretório existe. Se não existir dar um aviso.
		- Se existir listar o diretório no formato longo, paginando a saida.
	
04 - Se foi digitado "3":
		- Solicitar ao usuário um nome de diretório (o caminho deve será fornecido junto).
		- Verificar se o não diretório existe. Se existir dar um aviso.
		- Se não existir criar um diretório.
		
05 - Se foi digitado "9"
		- Encerrar o script.
		- O script só deverá ser encerrado através desta opção.
		
05 - Se não foi digitado "1", "2", "3" e "9":
		- Avisar ao usuário que a opção é inválida.
		
06 - Após o script dar a resposta de qualquer opção, com exceção da "Z":
		- Solicitar ao usuário para dar um <ENTER> para ele visualizar a resposta.
		- Voltar a limpar a tela e exibir o menu inicial.
'

AuxWhile=0
while test $AuxWhile -ne 99
do
	clear
	
	echo "ALUNO: Gustavo Rocha Maia"
	
	echo "Selecione uma opção:"
	echo "1 = Calcular o perimetro de um retangulo;"
	echo "2 = Listar um diretório;"
	echo "3 = Criar um diretório;"
	
	echo "9 = Encerrar Script."

	read operacao
	
	case $operacao in
		1) echo "Digite a altura de um retangulo"
		   read altura
		   
		   echo "Digite a largura de um retangulo"
		   read largura
		   
		   somaretangulo=`expr $altura + $largura`
		   retangulo=`expr 2 \* $somaretangulo`
			
		   if test $retangulo -lt 70
		   then
				echo "Resultado menor que o esperado = $retangulo"
		   else
				echo "Resultado maior que o esperado = $retangulo"
		   fi;;

		2) echo "Digite o nome de um diretório com o seu respectivo caminho."
				read diretorio
				if test -d $diretorio
				then
					ls -l $diretorio | more
				else
					echo "Diretório não existe."
				fi;;
				
		3) echo "Digite o nome de um diretório com o seu respectivo caminho."
				read diretório
				if test -d $diretorio
				then
					echo "Diretório ja existe."
				else
					echo "O arquivo digitado não existia, mas foi criado."
					mkdir $diretorio
				fi;;
				
		9) break;;
		
		*) echo "Opção inválida!"
	esac
	
	echo "Aperte a tecla <ENTER> para continuar !"
	read enter
	
done
