function x = matrix_solver(A,b)
  [n,~] = size(A);
  ##Making the upper triangle
  for (x = 1:n-1)
    y=x;
    
    ##precaution swapping
    while (A(x,x) == 0)
      y++;
      if (y>n) 
        error("No concrete answer");
      endif
      printf("swapping\n")
      [A,b] = swapR(A,b,x,y);
    endwhile
    
    
    ##pyramid time
    for (yy=x+1:n)
      m = A(yy,x)/A(x,x);
      
      #subtraction
      b(yy)-=m*b(x);
      A(yy,:)-=m*A(x,:);
    endfor
  endfor

  
  ##constructing the final answer
  for (x = n:-1:1)
     b(x)/=A(x,x);
     A(x,x) = 1;
    for (y = x-1:-1:1)
      b(y)-=b(x)*A(y,x);
      A(y,x)= 0;
    endfor
  endfor
  
  x = b;
endfunction


function [A,b] = swapR(A,b,current,new)

  temp = A(current,:);
  A(current,:) = A(new,:);
  A(new,:) = temp;
  
  temp = b(current);
  b(current) = b(new);
  b(new) = temp;
  
endfunction
