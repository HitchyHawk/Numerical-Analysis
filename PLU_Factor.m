function [P,L,U] = PLU_Factor(A)
  ##get the size of A and call it n. Then make identity matrix for later, also back up A.
  [n,~] = size(A);
  U = A;
  P = L =eye(n);
  swapmade = 0;
  
  ##perform Elimination
  for i = 1:n-1;
    ##if zero make a swap
    if (U(i,i) == 0)
      swapmade = 1;
      for newrow = i+1:n;
        if (U(newrow,i) != 0)
          
          U = swap(U,i,newrow);
          P = swap(P,i,newrow);
          
          break;
        endif
      endfor
    endif
    [L,U] = recordAndCalculate(L,U,i,n);
  endfor
  
  ##if a swap happend recalculate L
  if (swapmade == 1)
    U = P*A;
    for (i = 1:n-1);
      [L,U] = recordAndCalculate(L,U,i,n);
    endfor
  endif
  P=P';
endfunction

##finds the multiplier, and saves it, negatively.
function [L,U] = recordAndCalculate(L,U,i,n)
  for (j = i+1:n)
      m = -U(j,i)/U(i,i);
      L(j,i) = -m;
      U(j,:) += m*U(i,:);
    endfor
endfunction

##Swaps two rows because Octave doesnt have a easy way to do it.
function U = swap(U,row1,row2)
  buffer = U(row1,:);
  U(row1,:) = U(row2,:);
  U(row2,:) = buffer;
  
endfunction
