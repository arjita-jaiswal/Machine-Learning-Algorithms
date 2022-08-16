function ret = pivot_cols(M)
  col = [];
  z = [];
  i = 0;
  [R, C] = size(M);
  for i = 1:R
    for j =1:C
      if (M(i,j) != 0)
        col = [col, j];
        z = [z, M(i,j)];
        break;
      endif;
    end;
  end;
  disp('Pivot columns = ');
  disp(col);
  disp('Pivots = ');
  disp(z);
  disp('Rank = ');
  [m,n] = size(z);
  disp(n);
  ret = 0;
endfunction;