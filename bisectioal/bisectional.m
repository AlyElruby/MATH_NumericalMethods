f=str2func(input('Enter equation with variables as follows as @(x) ','s'));
x0=input('\n Enter the start of the interval ');
x1=input('\n Enter the end of the interval ');
erorr=input('\n Enter the error ');
if (f(x0)*f(x1))>0 
    fprintf('Not valid interval\n');
    break;
else
x2 = (x0 + x1)/2;
err = abs(x0-x1);       
while err >erorr
    if (f(x0)*f(x2))<0 
       x1 = x2;
    else
      x0 = x2;          
    end
     x2 = (x0 + x1)/2;
     err = abs(x2-x1); 
     solution=x2;
end
   fprintf('\n The solution is %4.4f \n',solution);
end
