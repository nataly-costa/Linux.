/* Sistemas Operacionais - Exercicío 07 - Script Shell

- Exiba o seguinte menu de opções:
--------------------------------
Nome do aluno: Gustavo Rocha Maia

Selecione uma opção:
1 - Listar o conteúdo de um arquivo.
2 -	Criar um diretório.
3 - Listar um diretório.
4 - Calcular a area de um quadrado.

99 - Encerrar Script.
--------------------------------
00 - Desenvolva o seguinte algoritmo:

01 - Sempre limpar a tela antes de exibir o menu inicial.

02 - Se foi digitado "1":
		- Solicitar ao usuário um nome de um arquivo (o caminho deve será fornecido junto).
		- Verificar se o arquivo existe. Se não existir dar um aviso.
		- Se existir listar o arquivo paginando a sáida.

03 - Se foi digitado "2":
		- Solicitar ao usuário um nome de diretório (o caminho deve será fornecido junto).
		- Verificar se o não diretório existe. Se existir dar um aviso.
		- Se não existir criar um diretório.

04 - Se foi digitado "3":
		- Solicitar ao usuário um nome de diretório (o caminho deve será fornecido junto).
		- Verificar se o diretório existe. Se não existir dar um aviso.
		- Se existir listar o diretório no formato longo, paginando a saida.

05 - Se foi digitado "4":
		- Solicitar ao usuário o lado de um quadrado.
		- Calcular a area.
		- Exibir o resultado ao usuário "AREA = NNN".
		- Caso o resultado seja maior que 120, exibir a mensagem "AREA ACIMA DO LIMITE".

06 - Se foi digitado "99":
		- Encerrar o script.
		- O script só deverá ser encerrado através desta opção.
		
07 - Se não foi digitado "1","2","3","4","9":
		- Avisar ao usuário que a opção é inválida.

08 - Após o script dar a resposta de qualquer opção, com exceção da "99":
		- Solicitar ao usuário para dar um <ENTER> para ele visualizar a resposta.
		- Voltar a limpar a tela e exibir o menu inicial.
*/

AuxWhile=0
while test $AuxWhile -ne 99
do
	clear
	
	echo "ALUNO: Gustavo Rocha Maia"
	
	echo "Selecione uma opção:"
	echo "1 = Listar o conteúdo um arquivo texto."
	echo "2 = Criar um diretório."
	echo "3 = Listar um diretório."
	echo "4 = Calcular a area de um quadrado."
	
	echo "99 = Encerrar o script."
	
	read operacao
	
	case $operacao in
		1) echo "Digite o nome de um arquivo com o seu respectivo caminho."
				read diretorio
				if test -f $diretorio
				then
					more $diretorio
				else
					echo "Arquivo não existe."
				fi;;
		2) echo "Digite o nome de um diretório com o seu respectivo caminho."
				read diretório
				if test -d $diretorio
				then
					echo "Diretório ja existe."
				else
					echo "O arquivo digitado não existia, mas foi criado."
					mkdir $diretorio
				fi;;
		3) echo "Digite o nome de um diretório com o seu respectivo caminho."
				read diretorio
				if test -d $diretorio
				then
					ls -l $diretorio | more
				else
					echo "Diretório não existe."
				fi;;
		4) echo "Digite o lado de um quadrado: "
				read ladoquadrado
					area=`expr $ladoquadrado \* $ladoquadrado`
						echo "RESULTADO = $area"
				
				if test $area -gt 120
				then
					echo "AREA ACIMA DO LIMITE!"
				fi;;
		99) break;;
		
		*) echo "Opção inválida!"
	esac
	
	echo "Aperte a tecla <ENTER> para continuar !"
	read enter
	
done