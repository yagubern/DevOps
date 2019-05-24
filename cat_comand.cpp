#include <stdio.h>
#include <stdlib.h>
 
void print_file(const char*);
 
int main(int argc, char* argv[])
{
    if(argc == 1)
        print_file("-");
        
    int i;
    
    for(i = 1; i < argc; ++i)
        print_file(argv[i]);
 
    exit(0);
}
 
void print_file(const char* file)
{
    FILE* f;
    static char buf[BUFSIZ];
    if(strcmp(file, "-") == 0)
        f = stdin;
    else if((f = fopen(file, "r")) == NULL)
    {
        perror("cat");
        return;
    }
    
    while(fgets(buf, BUFSIZ, f))
        if(fputs(buf, stdout) == EOF)
        {
            perror("cat");
            break;
        }
        
    if(ferror(f))
        perror("cat");
        
    if(f != stdin)
        fclose(f);
}