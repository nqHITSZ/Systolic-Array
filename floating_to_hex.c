#include <stdio.h>
#include <stdlib.h>

int main()
{
    float a;
    unsigned char *p;
    int i;
    while(1)
    {
        printf("Floating point number = ");
        scanf("%f",&a);
        p=&a;
        printf("HEX = 32'H");
        for(i=sizeof(a)-1;i>=0;i--)
            printf("%02x",*(p+i) );
        printf("\n");
    }

    return 0;
}

