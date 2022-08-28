s=str2func(input('Enter equation with variables as follows as @(x,y,z) notice: Put the x (or t) first in the bracket ','s'));
x1=input('Enter the start of the interval:');
x2=input('Enter the end of the interval:');
h=input('Enter the step size:');
test=round(((x2-x1)/h)+1);
x=zeros(1,test);
x(1)=x1;
x(test)=x2;
y=zeros(1,test);
y(1)=input('Enter the initial value of the function:');
n=round((x2-x1)/h);
for m=2:n
    x(m)=x(1)+h*(m-1);
end
for i=1:n
  yp=y(i)+h*(s(x(i),y(i)));
  y(i+1)=y(i)+(h/2)*(s(x(i),y(i))+s(x(i+1),yp));
end
for l=1:n+1
    fprintf('The value of y''(%.3f) is %f \n',x(l),y(l));
end
r=linspace(x(1),x(n+1));
yr=zeros(1,100);
yr(1)=y(1);
hr=r(2)-r(1);
for i=1:99
  yp=yr(i)+hr*(s(r(i),yr(i)));
  yr(i+1)=yr(i)+(hr/2)*(s(r(i),yr(i))+s(r(i+1),yp));
end
plot(r,yr,'-r','LineWidth',2);
hold on;
grid on;
plot(x,y,'--b');
plot(x, y, '.', 'markersize', 20);