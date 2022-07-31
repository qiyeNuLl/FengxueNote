#include<stdio.h>
int func(int n){
	int i;
	for(i=2; i<n; i++){
		if (n%i == 0){
			return 0;
		}else{
			continue;
		}
	}
	return 1;
}

int Sum(int n){
	int i,sum=2;
	for(i=3; i<=n; i+=2){
		sum += func(i)?i:0;
	}
	return sum;
}

int main()
{
	int n;
	scanf("%d",&n);
	if (n < 3){
		printf("2");
	}else{
		printf("%d",Sum(n));
	}	
	return 0;
}