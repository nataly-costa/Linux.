/* Aula 02 - Nano Linux */

/*Aplicação exemplificada em sala de aula. O algoritmo foi desenvolvida no Nano e executado em background(&), além disso, 
o processo pai foi executado após a interrupção do processo filho */

/* arquivo exemplo_05.c */

#include <errno.h>
#include <signal.h>
#include <stdio.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/wait.h>

int main() {
    int rcode ;
    
    printf("\n\nPAI- Ola, sou o processo EXEMPLO_05 de PID=%d.\n",getpid());
    printf("\nPAI- Vou gerar o meu primeiro filho...\n");
    
    rcode = fork();
    if (rcode == 0){
        printf("\n\tFILHO1- Oi, eu sou %d, o filho de %d.\n",getpid(),getppid());
        sleep(3);
        printf("\n\tFILHO1- Estou executando normalmente...\n");
        printf("\n\tFILHO1- Pois e, Chegou minha hora! Encerrando com exit().\n");
        return 7;
    }
    
    else{
        int ret1, status1, ret2;
        
        printf("\nPAI- Olha ai, meu primeiro filho %d esta executando...\n",rcode);
        ret1 = wait(&status1);
            if ((status1&255) == 0){
             printf("\nPAI- Meu primeiro filho morreu. Valor meu wait():%d\n",ret1);
             printf("\nPAI- Ele morreu com um exit de codigo %d.\n",(status1>>8));
            }
            else{
                printf("\nPAI- Meu filho nao foi morto por um exit.\n");
            }
            printf("\nPAI- Sou eu ainda, o processo %d.\n", getpid());
            printf("\nPAI- Vou gerar agora meu segundo filho\n");
            ret2 = fork();
                if (ret2 == 0){
                    printf("\n\tFILHO2- Sou %d, segundo filho de %d\n",getpid(),getppid());
                    sleep(3);
                    printf("\n\tFILHO2- Eu nao quero seguir o exemplo de meu irmao!\n");
                    printf("\n\tFILHO2- Nao vou morrer... Vou ficar num loop eterno!\n");
                    for(;;);
                }
                else{
                int ret3, status3, s;
                
                    printf("\nPAI- Sou eu ainda (de novo), o processo %d.\n", getpid());
                    ret3 = wait(&status3);
                        if ((status3&255) == 0){
                            printf("\nPAI- Meu segundo filho nao foi morto por um sinal!!\n");
                }
                        else{
                            printf("\nPAI- Valor de retorno do wait(): %d\n",ret3);
                            s = status3&255;
                            printf("\nPAI- O sinal que matou meu filho foi: %d\n",s);
                            printf("\nPAI- Agora sou eu que vou partir... Tchau!\n");
                        }
                }
        }
 return 0;
}
