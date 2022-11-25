" Criar um arquivo texto (manualmente) que terá o nome de 'dir50' que vai ser a saída do 
comando ls -l de um diretório qualquer. Este será o arquivo a ser lido pelo AWK.

Criar um programa 'AWK200' que:
	01 - Dar a mensagem inicial 'Distribuição de arquivos por tamanho."'
	
	02 - Ler os registros do arquivo de entrada 'dir200':
		2.01 - Ignorar registros que não tenham dados completos de arquivos;
		2.02 - Exibir para cada registro aceito o nome e o tamanho do arquivo.
		
	03 - No final, fornecer ao usuário:
		3.01 - Número total de registros = nnn 
		3.02 - Quantidade toal em bytes do espaço usado = nnnn
		3.03 - Número de arquivos pequenos = nnnn - nn% ( com tamanho < 1024bytes )
		3.04 - Número de arquivos grandes = nnnn - nn% ( com tamanho >= 1024bytes )		
"

BEGIN{	
	print "Distribuição de arquivos por tamanho."
	
	numtotalaceitos = 0
	qtdebytes = 0

	numarqpequenos = 0
	numarqgrandes = 0
	
	resultarqpequenos = 0
	resultarqgrandes = 0
}

NF > 8{	
	numtotalaceitos++
	
	print "O Nome do arquivo eh: ", $9, "O tamanho do arquivo eh: ", $5
	
	if($5 < 1024){
		numarqpequenos++
	}
	else{
		numarqgrandes++
	}

}
END{ 
	resultarqpequenos = (numarqpequenos / numtotalaceitos)*100
	resultarqgrandes = (numarqgrandes / numtotalaceitos)*100
	
	qtdebytes = resultarqgrandes + resultarqpequenos
	print "\n O numero total de registros aceitos eh: ", numtotalaceitos
	print "\n A quantidade total em bytes do espaco usado eh: ", qtdebytes
	print "\n O numero de arquivos pequenos eh: ", numarqpequenos "-" resultarqpequenos, "%"
	print "\n O numero de arquivos grandes eh: ", numarqgrandes "-" resultarqgrandes, "%"
}

"Comando utilizado para rodar o awk: awk -F" " -f awk200 dir50"