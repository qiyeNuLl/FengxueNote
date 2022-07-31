int Sum(int n){
	int i,j,sum=2;
	for(i=3; i<=n; i+=2){
		for (j=2; j<i; j++){
			if (i%j == 0){
				break;
			}else{
				continue;
			}
		}
		
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