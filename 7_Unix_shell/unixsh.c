#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>
#include <ctype.h>
#include <signal.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <errno.h>
#include <string.h>

int main()
{
    int i, pid;
    char *token, command[2000], *arguments[10];
    
    while(1)
    {
        printf("%% ");
        if((fgets(command, sizeof(command), stdin) == NULL) && ferror(stdin))
        {
            printf("fgets error\n");
        }
        if(feof(stdin))
        {
            exit(0);
        }
        command[strlen(command)-1] = 0;

        token = strtok(command, " ");
        if (token == NULL)
        {
            exit(-1);
        }

        arguments[0] = token;
        for (i = 1; i<10; i++) 
        {
            token = strtok(NULL, " ");
            if (token == NULL)
                break;
            arguments[i] = token;
        }
        arguments[i] = NULL;
        if(!strcmp(arguments[0],"exit"))
        {
            exit(0);
            return 1;
        }

        pid = fork();
        if(pid < 0)
        {
            printf("fork error\n");
        }
        else if (pid != 0)
        {
            wait(NULL);
        } 
        else 
        {
            if(execvp(arguments[0], arguments)<0)
            {
                printf("%s:Command not found\n",arguments[0]);
                exit(0);
            }
        }
    }
}