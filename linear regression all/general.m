prompt='Please enter the number of coordinates ';
n=input(prompt);
x=zeros(1,n);
y=zeros(1,n);
for i=1:n
    fprintf('Enter the node no. %d \n',i);
    x(i)=input('X coordinate  ');
    y(i)=input('Y coordinate  ');
end
fprintf('Choose type of linearized model desired from the following :\n1.Linear Equation\n2.Power Model\n3.Exponential Model\n4.Growth rate Model\n');
no=input('Enter the number of the model:  ');
if (no==1)
sx=sum(x);
ssx=sum(x.^2);
sy=sum(y);
sxy=sum(x.*y);
a=[n,sx;sx,ssx];
b=[sy;sxy];
sol=zeros(2,1);
sol=a\b;
t=linspace(x(1),x(n));
fprintf('The required cofficents are %f and %f\n',sol(1),sol(2));
yt=sol(1)+ sol(2)*t;
plot(t,yt,'-r','LineWidth',2.0);
hold on;
plot(x, y, '.', 'markersize', 20);
grid on;
ym=sy/n;
st=sum((y-ym).^2);
sr=sum((y-sol(1)-sol(2).*x).^2);
rs=(st-sr)/st;
r=sqrt(rs);
fprintf('Coefficient of Determination = %f \nCorrelation Coefficient = %f \n',rs,r);
end
if (no==2)
xp=log10(x);
yp=log10(y);    
sx=sum(xp);
ssx=sum(xp.^2);
sy=sum(yp);
sxy=sum(xp.*yp);
a=[n,sx;sx,ssx];
b=[sy;sxy];
sol=zeros(2,1);
sol=a\b;
t=linspace(x(1),x(n));
am=10^sol(1);
fprintf('The required cofficents are %f and %f\n',am,sol(2));
yt=am*t.^sol(2);
plot(t,yt,'-r','LineWidth',2.0);
hold on;
plot(x, y, '.', 'markersize', 20);
grid on;
ym=sy/n;
st=sum((yp-ym).^2);
sr=sum((yp-sol(1)-sol(2).*xp).^2);
rs=(st-sr)/st;
r=sqrt(rs);
fprintf('Coefficient of Determination = %f \nCorrelation Coefficient = %f \n',rs,r);
end
if (no==3)
xp=x;
yp=log(y);    
sx=sum(xp);
ssx=sum(xp.^2);
sy=sum(yp);
sxy=sum(xp.*yp);
a=[n,sx;sx,ssx];
b=[sy;sxy];
sol=zeros(2,1);
sol=a\b;
t=linspace(x(1),x(n));
am=exp(sol(1));
fprintf('The required cofficents are %f and %f\n',am,sol(2));
yt=am*exp(t.*sol(2));
plot(t,yt,'-r','LineWidth',2.0);
hold on;
plot(x, y, '.', 'markersize', 20);
grid on;
ym=sy/n;
st=sum((yp-ym).^2);
sr=sum((yp-sol(1)-sol(2).*xp).^2);
rs=(st-sr)/st;
r=sqrt(rs);
fprintf('Coefficient of Determination = %f \nCorrelation Coefficient = %f \n',rs,r);
end
if (no==4)
xp=1./x;
yp=1./y;    
sx=sum(xp);
ssx=sum(xp.^2);
sy=sum(yp);
sxy=sum(xp.*yp);
a=[n,sx;sx,ssx];
b=[sy;sxy];
sol=zeros(2,1);
sol=a\b;
t=linspace(x(1),x(n));
am=1/sol(1);
bm=am*sol(2);
fprintf('The required cofficents are %f and %f\n',am,bm);
yt=(t.*am)./(bm+t);
plot(t,yt,'-r','LineWidth',2.0);
hold on;
plot(x, y, '.', 'markersize', 20);
grid on;
ym=sy/n;
st=sum((yp-ym).^2);
sr=sum((yp-sol(1)-sol(2).*xp).^2);
rs=(st-sr)/st;
r=sqrt(rs);
fprintf('Coefficient of Determination = %f \nCorrelation Coefficient = %f \n',rs,r);
end