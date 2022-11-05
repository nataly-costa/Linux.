BEGIN {
	print "INICIANDO O EXERCICIO DE AWK 02"
}
$5 >= 5000 {
	print "Nome do arquivo = ", $9, "Tamanho do arquivo = ", $5
}
END {
	print "TOTAL = ", NR
}