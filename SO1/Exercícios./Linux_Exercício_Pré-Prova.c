//Exercício de Sistemas Operacionais - Preparação para prova [P2].

#include <errno.h>
#include <signal.h>
#include <stdio.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/wait.h>

//Legendas: Variáveis FILHO são utilizadas para criação de filhos e testes lógicos.

//Legendas: Variáveis XFILHO são utilizadas apenas em prints.

//Legendas: Sempre lidar com o pai primeiro. Em seguida, lidar com os filhos em ordem númerica.

int main(void)
{   int Filho1, Filho2, Status1, Status2;
    int xFilho1, xFilho2;

    printf("\n\n01-PAI-INICIANDO O PROGRAMA exercício_01.c");
    printf("\n\n02-PAI-SOU O PROCESSO %d DE PAI %d.", getpid(), getppid());

    Filho1 = fork();
    
    if(Filho1 > 0){
        xFilho1 = wait(&Status1);
        printf("\n\n08-PAI-ACORDEI. MEU FILHO %d TERMINOU.", xFilho1);
        return 0;
    }
    
    else{
        printf("\n\n03-FILHO1-SOU O PROCESSO %d DE PAI %d.", getpid(), getppid());
        printf("\n\n04-FILHO1-EU TAMBÉM VOU CRIAR UM FILHO.");
        
        Filho2 = fork();
        
            if(Filho2 > 0){
                xFilho2 = wait(&Status2);
                printf("\n\n07-FILHO1-ACORDEI. MEU FILHO DE %d TERMINOU.", xFilho2);
                return 0;
            }
            
            else{
                printf("\n\n05-FILHO2-SOU O PROCESSO %d DE PAI %d.", getpid(), getppid());
                printf("\n\n06-FILHO2-AGORA VOU ENTRAR EM LOOP ETERNO.");
                for(;;);
            }
    }
}