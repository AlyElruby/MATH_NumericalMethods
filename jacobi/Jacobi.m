num=input('Enter number of equations');
A=zeros(num,num);
b=zeros(num,1);
for i=1:num
    for k=1:num
        fprintf('enter the coffecient of eqn %i and variable %i  ',i,k)
        A(i,k)=input(' ');
    end    
        fprintf('enter the absolute value of eqn %i  ',i);
        b(i,1)=input(' ');
end
itrmax=input('Enter the No.of iterations');
x=zeros(num,1);
n=size(x,1);
itr=0;
while itrmax>itr
    xold=x;
    
    for l=1:n
        sigma=0;
        for j=1:n
            
            if j~=l
                sigma=sigma+A(l,j)*x(j);
            end
            
        end
        
        x(l)=(1/A(l,l))*(b(l)-sigma);
    end
    
    itr=itr+1;
end
fprintf('Solution of the system is :');
x