syms x ;
s=str2func(input('Enter equation with variables as follows as @(x,y,z) ','s'));
n=input('Enter the number of segments :');
f=zeros(1,n+1);
y=zeros(1,2);
in=zeros(1,n-1);
y(1)=input('Enter the lower limit of the integeration :');
y(2)=input('Enter the upper limit of the integeration :');
f(1)=s(y(1));
f(n+1)=s(y(2));
h=(y(2)-y(1))/n;
for i=1:n-1
    in(i)=y(1)+h*i;
    f(i+1)=s(in(i));
end
answer=(h/2)*(f(1)+f(n+1)+2*(sum(f)-f(1)-f(n+1)));
all=[y(1) in y(2)];
r=linspace(y(1),y(2));
plot(all,f);
hold on;
z=1;
cor=[];
while(z<101)
    cor=[cor s(r(z))];
    z=z+1;
end
plot(r,cor,'-r');
fprintf('The answer of the integeration is %f\n',answer);