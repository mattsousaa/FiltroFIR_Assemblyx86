#include <stdio.h>
#include <stdlib.h>
#include <poll.h>
#include <unistd.h>
#include <time.h> 

/* 

Comandos para compilação no terminal:

gcc -c filtro.c
nasm -f elf64 teste1.asm -o teste1.o
gcc filtro.o teste1.o -o app
./app

*/

void multiplica(int *vetfil, int *vetsinal, int *vetsaida, int t_filtro, int t_saida);


int main(){

	//Relógio
	clock_t begin = clock();

	system("/usr/bin/clear");

	struct pollfd mypoll = { STDIN_FILENO, POLLIN|POLLPRI };

	int filtro; 
	int i;

	while(1){
		printf("Digite o tamanho do filtro: \n");
		if(poll(&mypoll, 1, 6000)){
			scanf("%d", &filtro);
				break;
		}
		else{
			//system("clear");
			printf("Digita alguma coisa mahhh!\n");
			sleep(3);
			system("/usr/bin/clear");
		}
	}

	printf("\n");
	
	int tamanho = 10-filtro;
	int vetor1[filtro];
	int vetor2[10];
	int vetor3[tamanho];

	for(i = 0; i < filtro; i++)
		scanf("%d", &vetor1[i]);

	printf("\n");

	FILE *fp;
   	char str[10];

   	/* opening file for reading */
   	fp = fopen("sinal.txt" , "r");
   
   	if(fp == NULL){
    	perror("Error opening file! \n");
      	return -1;
   	}

   	i = 0;

    while(!feof(fp)){
    	if(fgets (str, 10, fp) != NULL){
      		
      		vetor2[i++] =  atoi(str);
   	  	}
   	}

   	fclose(fp);

   	printf("Vetor do sinal: \n");
	for(i = 0; i < 10; i++)
		printf("%d ", vetor2[i]);

	printf("\n");

	multiplica(vetor1, vetor2, vetor3, filtro, tamanho);

	printf("\n");

	printf("Vetor resultante: \n");
	for(i = 0; i < 10-filtro; i++)
		printf("%d ", vetor3[i]);	

	printf("\n");

	clock_t end = clock();
	double time_spent = (double)(end - begin) / CLOCKS_PER_SEC;

    printf("Tempo total de execução: %f ms\n", time_spent);
}
