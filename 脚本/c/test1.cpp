#include<stdio.h>
void func(int n)
{
	int a[n],i;
	for(i=0; i<=n-1; i++)
		a[i] = i;
	for(i=n-1; i>=0; i--)
		printf("%d",a[i]);
	printf("\n");
}

int main()
{
	int n;
	scanf("%d",&n);
	func(n+1);
	return 0;
}