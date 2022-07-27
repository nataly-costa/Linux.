//Sistemas Operacionais - Prova prática. [P2] 

#include <errno.h>
#include <signal.h>
#include <stdio.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/wait.h>

int main(void)
{   int Filho1, Filho2;
    int xFilho1, xFilho2;
    int Status1, Status2;

    printf("\n01 - (PAI) Eu sou o processo %d de pai %d.\n", getpid(), getppid());
    printf("\n02 - (PAI) Agora vou criar um novo filho.\n");
    
    Filho1 = fork ();
    
    if( Filho1 > 0 ){
        xFilho1 = wait(&Status1);
        printf("\n05 - (PAI) Acordei porque meu filho %d terminou.\n", xFilho1);
        printf("\n06 - (PAI) Agora vou criar outro filho.\n");
        
        Filho2 = fork();
            if( Filho2 > 0 ){
                xFilho2 = wait(&Status2);
                printf("\n09 - (PAI) Acordei de novo porque meu filho %d terminou.\n", xFilho2);
                printf("\n10 - (PAI) Terminando o processo pai %d normalmente.\n", getpid());
                return 0;
            }
            else{
                printf("\n07 - (FILHO2) Eu sou o processo %d de pai %d.\n", getpid(), getppid());
                printf("\n08 - (FILHO2) Vou entrar em loop eterno...\n");
                for(;;);
            }
    }
    else{
        printf("\n03 - (FILHO1) Eu sou o processo %d de pai %d.\n", getpid(), getppid());
        printf("\n04 - (FILHO1) Vou encerrar minhas atividades normalmente.\n");
        return 0;
    }
}