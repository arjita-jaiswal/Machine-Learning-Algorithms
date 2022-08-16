clc();

%take input from user or consider your matrix
 r = input('Row size: ');
 c = input('Col. size: ');
 A = [];
 
 disp('Enter elements: ');
 for i=1:r
     for j=1:c
         A(i,j) = input('enter: ');
     end
 end
     
 A=reshape(A,r,c);
        
%A = [1 -2 0 4;3 1 1 0;-1 -5 -1 8;3 8 2 -12];
[r,c] = size(A);
disp('Given Matrix A: ');
A
%rnk = min(r,c);
rnk=c;
for row=1:min(r,c)4
    if A(row,row)~=0
        for col=1:r
            if col ~= row
                %find the multiplier
                mult = A(col,row)/A(row,row);
                %subtract all other columns to make them 0
                for i=1:rnk
                    A(col,i) = A(col,i) - mult*A(row,i);
                end
            end
        end
        
    else
        reduce = 1;
        for i=row+1:r
            if A(i,row) ~= 0
                %swap the rows
                temp_row = A(i,:);
                A(i,:) = A(row,:);
                A(row,:) = temp_row;
                reduce = 0;
                break;
            end
        end
        %if not found any diag element to be 0 (means all are zero below)
        %so replace this column with the last column (we could have swapped
        %also)
        if reduce == 1
            rnk = rnk-1;
            %swap
            %temp_col = A(:,row);
            %A(:,row) = A(:,rnk);
            %A(:,rnk) = temp_col;
            
            %replace
            for i=1:r
                A(i,row) = A(i,rnk);
            end
            
            %ultimate result is the same
        end
        row = row-1;
    end
    %print intermediate results
    A
                
end
disp('Final Matrix A: ');
A
rnk