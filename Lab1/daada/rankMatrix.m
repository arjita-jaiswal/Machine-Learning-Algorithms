function [r, X] = rankMatrix(M)
  [R, C] = size(M);
  rank = min(R,C);
  t = 1;
  row = 1;
  while (row<=C)
    if (row>R)
      break;
    end;
    if (t>C)
      break;
    end;
    if (M(row,t) != 0)
      for col = row+1:R
        ratio = M(col,t)/M(row,t);
        for i = 1:C
          M(col,i) = M(col,i) - ratio * M(row,i);
        end;
      end;
    else
      flag = 1;
      for i = row+1:R
        if (M(i,t) != 0)
          M([row,i],:) = M([i,row],:);
          flag = 0;
          break;
        endif;
      end;
      if (flag == 1)
        rank = rank-1;
      endif;
      if (flag == 0)
        t = t-1;
      endif;
      row = row-1;
    end;
    t = t+1;
    row = row+1;
  endwhile;
  r = rank;
  X = M;
endfunction