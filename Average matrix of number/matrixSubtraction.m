function c = matrixSubtraction(a,b)
  for (x = 1:rows(a))
    for (y = 1:columns(a))
      c(x,y) = a(x,y)-b(x,y);
    endfor
  endfor
endfunction
