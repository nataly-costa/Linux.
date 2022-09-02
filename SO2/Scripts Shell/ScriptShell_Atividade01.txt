/*1- Limpe a tela;

2- Solicite ao usuário para digitar o lado de um quadrado;

3- Calcule o perímetro do quadrado e exiba "Perimetro = nnn";

4- Verificar se o perímetro é maior que 100;

5- Se for, dar a mensagem "Perimetro nnn excede o limite". 
Caso contrário, dar a mensagem "Perimetro nnn na faixa normal".

6- Solicite um <ENTER> para continuar;

7- Limpe a tela;

8- Solicite ao usuário o nome de um diretório (com o caminho junto);

9- Verificar se o diretório existe;

10- Se existir, listá-lo no formato longo paginando a saída;

11- Se não existir, dar uma mensagem ao usuário dizendo que não existe.
*/

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