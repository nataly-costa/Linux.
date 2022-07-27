/* Aula 01 - Nano Linux */

#include <stdio.h>
#include <unistd.h>

int main(void)
{   int retcode;

    printf("\n...INICIANDO EXECUCAO DO PROGRAMA EXEMPLO_03.C\n");
    
    retcode = fork();
    //testando o processo PAI e FILHO o seu PID;
    if(retcode != 0){
        printf("\n...Eu sou o processo PAI de PID=%d e meu filho tem o PID=%d \n",getpid(),retcode); 
    }
    // testando o processo filho.
    else{
        printf("\n...Eu sou o processo FILHO \n"); 
    }
    printf("\n...Terminando a minha execucao. Goodbye!!! \n\n");
    return 0;
}
