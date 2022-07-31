#include<stdio.h>
int main()
{
int i;
char a[30]=“afZ_r9VYfScOeO_UL^RWUc”;
for(i=0;a[i];i++)
{
a[i]=a[i]+i+5;
printf("%c",a[i]);
}
return 0;
}