#include<stdio.h>
#include<math.h>
//求三角形面积，公式根号(s(s-a)(s-b)(s-c))
int main(){
	double a,b,c,area,s;
	a = 3.2;
	b = 4.3;
	c = 3.0;
	s = (a+b+c)/2;
	area = sqrt(s*(s-a)*(s-b)*(s-c));
	printf("%f",area);
	return 0;
}