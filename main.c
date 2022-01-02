#include <stdio.h>

/* 
    from ReadFirst.asm 
    reads n > 0, the number of strings to be read (including the first string), and the first string s
    if n is <= 0, the function returns -1, otherwise 0
*/
int ReadFirst(int* n, char* s);

/*
    from Substring.asm
    returns 1 if s is a substring of buff, otherwise 0
*/
int Substring(char* buff, char* s);

/*
    from Response.asm
    returns the address of the string to be printed, "Yes\n" if Substring(buff, s) is 1, "No\n" otherwise
*/
char* Response(int);

int main()
{
    int n;
    char s[101];
    if (ReadFirst(&n, s) == -1) 
    {
       return 0;
    }
    char buff[101];
    for (int i = 2; i <= n; i++)
    {
        scanf("%s", buff);
        printf(Response(Substring(buff, s)));
    }

    return 0;
}