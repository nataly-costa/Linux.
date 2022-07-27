/* Aula 01 - Nano Linux */

/* Aplicação exemplificada em sala de aula. O algoritmo foi desenvolvida no Nano e executado em background(&). */

/* Testa as reacoes do console quando um pai morre e o filho continua vivo */
#include <errno.h>
#include <signal.h>
#include <stdio.h>
#include <unistd.h>
int main(void)
{   int pid ;
     printf("INICIANDO EXECUCAO DO PROGRAMA EXEMPLO_04.C \n");
     printf("PAI- Eu sou o pai %d e eu vou criar um filho \n",getpid()) ;
     
    pid=fork(); /* criacao do filho */
    
    if(pid == 0){ /* acoes do filho */
         printf("\tFILHO- Oi, eu sou o processo %d, o filho\n",getpid()) ;
         printf("\tFILHO- O dia esta otimo hoje, nao acha?\n") ;
         printf("\tFILHO- Bom, desse jeito vou acabar me instalando para sempre\n");
         printf("\tFILHO- Ou melhor, assim espero!\n") ;
        for(;;) ; /* o filho se bloqueia num loop infinito */ }
    else{ /* acoes do pai */
         sleep(3) ; /* para separar bem as saidas do pai e do filho */
         printf("PAI- As luzes comecaram a se apagar para mim, %d\n",getpid()) ;
         printf("PAI- Minha hora chegou : adeus, %d, meu filho\n",pid) ;
         return 0; /* e o pai morre de causas naturais */}
}
