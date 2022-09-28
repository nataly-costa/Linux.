clear 

echo "Informe o lado de um quadrado: "

read ladoquadrado

area=`expr $ladoquadrado \* 4`

echo "Perimetro = $area"

if test $area -gt 100
then
    echo "Perimetro $area excede o limite"
else
    echo "Perimetro $area na faixa normal"
fi

echo "Aperte a tecla ENTER"

read teclaEnter

clear

echo "Digite o nome de um diretorio com o seu respectivo caminho"
read diretorio

if test -d $diretorio
then
    ls -l $diretorio | more
else
    echo "Este diretorio nao existe"
fi