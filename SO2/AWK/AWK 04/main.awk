" Criar um arquivo texto (manualmente) que terá o nome de 'dir200' que vai ser a saída do 
comando ls -l de um diretório qualquer. Este será o arquivo a ser lido pelo AWK.

Criar um programa 'AWK200' que:
	01 - Dar a mensagem inicial 'Estatistica de diretório'.

	02 - Ler os registros do arquivo de entrada 'dir200':
		2.01 - Ignorar registros que não tenham dados completos de arquivos;
		2.02 - Ignorar registros de arquivos que tenham tamanho zero;
		2.03 - Exibir para cada registro aceito o nome e o tamanho do arquivo.

	03 - No final, fornecer ao usuário:
		3.01 - Número total de registros lidos; 
		3.02 - Número total de registros ignorados;
		3.03 - Número total de registros aceitos;
		3.04 - Número total de registros aceitos de arquivos tipo comum;
		3.05 - Número total de registros aceitos de arquivos tipo diretório;
		3.06 - Número total de registros aceitos de arquivos de outros tipos.
"
BEGIN{
	print "Estatistica do diretorio."
	
	numtotalreg = 0
	numtotalignorados = 0
	numtotalaceitados = 0
	
	numtotalarqcomum = 0
	numtotalarqdiretorio = 0
	numtotalarqoutros = 0
}

{	numtotalreg++;

	if($5 > 0 && NF > 8)
	{	print "O nome do arquivo eh: ", $9, "O tamanho do arquivo eh: ", $5
		numtotalaceitados++;
		
		if(substr($1, 1, 1) == "-"){
			numtotalarqcomum++;
		}
		else if(substr($1, 1, 1) == "d"){
			numtotalarqdiretorio++;
		}
		else{
			numtotalarqoutros++;
		}
	}
}

END{
	print "\nO numero total de registros lidos eh: ", numtotalreg
	
	print "\nO numero total de registros ignorados eh: ", numtotalreg - numtotalaceitados
	
	print "\nO numero total de registros aceitados eh: ", numtotalaceitados
	
	print "\nO numero total de registros aceitos de arquivos comuns eh: ", numtotalarqcomum
	
	print "\nO numero total de registros aceitos de arquivos diretórios eh: ", numtotalarqdiretorio
	
	print "\nO numero total de registros aceitos de arquivos de outro tipo eh: ", numtotalarqoutros
}

"Comando utilizado para rodar o awk: awk -F" " -f awk200 dir200"
