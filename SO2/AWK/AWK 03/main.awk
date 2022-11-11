# Criar um arquivo texto (manualmente) que terá o nome de "dir001" que vai ser a saída do
comando ls -l de um diretório qualquer. Este será o arquivo a ser lido pelo AWK.

Criar um programa AWK chamado "AWK131" que:
	01. Dar a mensagem inicial "Processando Diretorios";
	
	02. Ler os registros do arquivo de entrada "dir001":
	-	Ignorar os registros que não contenham informações completas do arquivo.
	-	Exibir o nome e o tamanho do arquivo para cada registros aceito.
	
	03. No final, fornecer para o usuário:
	-	Número total de arquivos aceitos.
	-	Quantidade total em bytes do espaço ocupado pelos arquivos aceitos.
	-	Tamanho médio dos arquivos aceitos.
	-	O nome e o tamanho do maior arquivo aceito.
#

BEGIN{
	print "PROCESSANDO DIRETÓRIOS."
	cont=0
	qtde=0
	media=0
	maior=0
}

$5 > 0{
	print "Nome do arquivo = ", $9, "Tamanho do arquivo = ", $5
	cont++
	qtde = qtde + $5
	if($5 > maior){
		maior=$5
		nomearquivo=$9
	}
}

END{
	media = qtde / cont
	
	print "O NUMERO TOTAL DE ARQUIVOS ACEITOS EH ", cont
	
	print "A QUANTIDADE TOTAL DOS ARQUIVOS EM BYTES EH ", qtde

	print "O TAMANHO MEDIO DOS ARQUIVOS EH ", media
	
	PRINT "O NOME DO MAIOR ARQUIVO EH ", nomearquivo, "E TAMANHO DO MAIOR ARQUIVO EH", maior
}
