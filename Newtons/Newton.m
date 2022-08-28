syms x;
S=input('Enter The equation f(x) in which f(x)=0 to find roots:  ','s');
func=str2func(sprintf('@(x)%s',S));
g=sym(func);
x=input('Enter initial guess: ');
storage=zeros(1,100);
storage(1,1)=x;
n=1000;
MaxEr=-1;
Choice=input('Choose Beetween \n1]Number of Iterations\n2]Maximum Absolute Error\nEnter Choice: ');
if(Choice==1)
n=input('\nEnter Number of iterations: ');
elseif(Choice==2)
MaxEr=input('\nEnter Absolute Max Error: ');
MaxEr=abs(MaxEr);
else
    while(Choice~=1&&Choice~=2)
        choice=input('Choose Beetween \n1]Number of Iterations\n2]Maximum Absolute Error\nEnter Choice: ');
    end
end
func_diff=matlabFunction(diff(g));
i=1;
while(i)
  x=x-(func(x))/(func_diff(x));
  i=i+1;
  storage(1,i)=x;
  if(abs((storage(1,i)-storage(1,i-1)))<=MaxEr)
      break;
  end
  if(i>n)
      break;
  end
end
fprintf('The root is equal to=%2f\n',x)