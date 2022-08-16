clear ; clc ; close all
C = input('Please Enter the elements of the Matrix C ' ) ;
#b = input('Please Enter the elements of the Matrix b ' ) ;

[m,n]=size(C)
#b = b'
A = [ C ]
[p,t]=size(A)
for j = 1:(n-1)
        for i= (j+1) : n
            mult = A(i,j)/A(j,j) ;
            for k= j:n+1
                A(i,k) = A(i,k) - mult*A(j,k) ;
                A
            end
        end
end
c=0;
disp('pivot column are...')
for i=1:p
    if A(i,i)~=0
        c=c+1;
        #disp("colum : ")
        disp(i)
    else
        for j=1:p
            if A(i,j)~=0
                c=c+1;
                #disp("colum : ")
                disp(j)
               break;
            end
        end
    end
end

disp("THE RANK OF MATRIX X IS..")
c