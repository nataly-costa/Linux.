# Exercício 01 - AWK.

BEGIN {
	print "INICIO DO PROGRAMA"
}
$2 = 3001 {
	print "Aluno = ", $1, "Faltas = ", $3
}
END {
	print "TOTAL ALUNOS = ", NR
}

# awk -F";" -f main.awk AuxFaltas.txt
