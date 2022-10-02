:'Sistemas Operacionais - Exercicío 09 - Script Shell
- Exiba o seguinte menu de opções:

--------------------------------
Nome do aluno: Gustavo Rocha Maia.
Selecione uma opção:
P = Procurar uma palavra em um arquivo texto.
N = Exibir o número total de arquivos de um diretório.
Z = Encerrar Script.
--------------------------------

00 - Desenvolva o seguinte algoritmo:
01 - Sempre limpar a tela antes de exibir o menu inicial.
02 - Se foi digitado "P":
		- Solicitar ao usuário um nome de um arquivo (o caminho deve será fornecido junto).
		- Verificar se o arquivo existe. Se não existir dar um aviso.
		- Se existir solicitar a palavra a ser buscada no arquivo e,
		dar o comando para buscar a palavra no arquivo.
		
03 - Se foi digitado "N":
		- Solicitar ao usuário um nome de diretório (o caminho deve será fornecido junto).
		- Verificar se o diretório existe. Se não existir dar um aviso.
		- Se existir fornecer os comandos para contar o número de arquivos que existem no diretório.
	
04 - Se foi digitado "Z":
		- Encerrar o script.
		- O script só deverá ser encerrado através desta opção.
		
05 - Se não foi digitado "P","N" e "Z":
		- Avisar ao usuário que a opção é inválida.
		
06 - Após o script dar a resposta de qualquer opção, com exceção da "Z":
		- Solicitar ao usuário para dar um <ENTER> para ele visualizar a resposta.
		- Voltar a limpar a tela e exibir o menu inicial.
'

AuxWhile=x
while test "$AuxWhile" != "Z"
do
	clear
	--------------------------------
	echo "ALUNO: Gustavo Rocha Maia"
	
	echo "Selecione uma opção:"
	echo "P = Procurar uma palavra em um arquivo texto."
	echo "N = Exibir o número total de arquivos de um diretório."
	
	echo "Z = Encerrar o script."
	--------------------------------
	
	read opcao
	case $opcao in
		"P")	echo "Digite o nome de um arquivo texto."
				read arquivo
				
				if test -f $arquivo
				then
					echo "Digite a palavra a ser buscada:"
					read palavra
						grep $palavra $arquivo
				else
					echo "Arquivo não existe."
				fi;;
				
		"N")	echo "Digite o nome de um diretório."
				read diretorio
			
				if test -d $diretorio
				then
					ls $diretorio | wc -l
				else
					echo "Diretório não existe."
				fi;;
				
		"Z")	break;;
	
		*)	echo "Opção inválida."
		
	esac
	
	echo "Aperte a tecla <ENTER> para continuar."
	read enter
	
done