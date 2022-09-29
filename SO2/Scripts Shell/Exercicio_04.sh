:'Sistemas Operacionais - Exercicío 08 - Script Shell
- Exiba o seguinte menu de opções:
--------------------------------
Nome do aluno: Gustavo Rocha Maia

Selecione uma opção:
A = Listar o conteúdo de um arquivo texto.
D = Listar um diretório.

Z = Encerrar Script.
--------------------------------
00 - Desenvolva o seguinte algoritmo:
01 - Sempre limpar a tela antes de exibir o menu inicial.

02 - Se foi digitado "A":
		- Solicitar ao usuário um nome de um arquivo (o caminho deve será fornecido junto).
		- Verificar se o arquivo existe. Se não existir dar um aviso.
		- Se existir listar o arquivo paginando a sáida.
		
03 - Se foi digitado "D":
		- Solicitar ao usuário um nome de diretório (o caminho deve será fornecido junto).
		- Verificar se o diretório existe. Se não existir dar um aviso.
		- Se existir listar o diretório no formato longo, paginando a saida.
		
04 - ATENÇÃO!!! Para as opções "A" e "D":
		- Após qualquer resposta da opção, perguntar ao usuário se ele quer listar um novo arquivo 
		(para opção "A") ou se ele quer listar um novo diretório (para opção "D").
		- Se ele responder SIM então iniciar novamente a respectiva opção.
		- Se ele responder NÃO então voltar a exibir a tela de menu inicial.
		
05 - Se foi digitado "Z":
		- Encerrar o script.
		- O script só deverá ser encerrado através desta opção.
		
06 - Se não foi digitado "A","D" e "Z":
		- Avisar ao usuário que a opção é inválida.
		
08 - Após o script dar a resposta de qualquer opção,
		- Solicitar ao usuário para dar um <ENTER> para ele visualizar a resposta.
		- Voltar a limpar a tela e exibir o menu inicial.
'

AuxWhile=x
while test "$AuxWhile" != "Z"
do
	clear
	
	echo "ALUNO: Gustavo Rocha Maia"
	
	echo "Selecione uma opção:"
	echo "A = Listar o conteúdo de um arquivo texto."
	echo "D = Listar um diretório."
	
	echo "Z = Encerrar Script."
	read opcao
	
	case $opcao in
		"A")	echo "Digite o nome de um arquivo com o seu respectivo caminho."
				read arquivo
				
				if test -f $arquivo
				then
					more $arquivo
				else
					echo "Arquivo não existe."
				fi
					set=sim
					while test "$set" != "nao"
					do
						echo "Deseja listar um novo arquivo? sim ou nao?"
						read newset
						
							case $newset in
							"sim") 	echo "Insira o nome do arquivo com o seu respectivo caminho."
									read novoarquivo
										
									if test -f $novoarquivo
									then
										more $novoarquivo
									else 
										echo "O arquivo digitado não existe."
									fi;;
							"nao") break;;
							esac
					done;;
					
		"D")	echo "Digite o nome de um diretório com o seu respectivo caminho."
				read diretorio
				
				if test -d $diretorio
				then
					ls -l $diretorio | more
				else
					echo "Diretório não existe."
				fi
					set=sim
					while test "$set" != "nao"
					do
						echo "Deseja listar um novo diretório? sim ou nao?"
						read newset
						
							case $newset in
							"sim") 	echo "Insira o nome do diretório com o seu respectivo caminho."
									read novodiretorio
										
									if test -d $novodiretorio
									then
										ls -l $novodiretorio | more
									else 
										echo "O diretório digitado não existe."
									fi;;
							"nao") break;;
							esac
					done;;
					
		"Z")	break;;
		
		*) 	echo "Opção inválida!"
	esac
	
	echo "Aperte a tecla <ENTER> para continuar."
	read enter
	
done