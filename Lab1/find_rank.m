A=input("Enter A");
  m=size(A,1);
  n=size(A,2);
  for i=1:m-1
    for j=1:n
      if A(i,j)!=0;
        break
      endif
    endfor
    for k=i+1:m
      if A(i,j)==0
        break
      endif    
      mult=A(k,j)/A(i,j);
      A(k,:)=A(k,:)-mult*A(i,:);
    endfor
  endfor
       A
       
       promp="Pivot containing column"
        count=m;
for i=1:m
  cnt=0;
  for j=1:n
    if A(i,j)==0
      cnt=cnt+1;
     else
      column_no=j
      pivot_element=A(i,j)
      column_contains_pivot_is=A(:,j)
      break
    endif
  endfor
  if cnt==n
    count=count-1;
  endif
  
endfor
rank_of_A=count
 