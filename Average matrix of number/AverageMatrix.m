function AverageMatrix(I,MAX)
  figure()
  for (i = 1:MAX)
    matrix = I;
    for (x = 1:rows(I))
      for (y = 1:columns(I))
        matrix(x,y) = averageCross(x,y,I);
      endfor
    endfor
    I = matrix;
    imshow(I)
    c = strcat(num2str(i),".PNG")
    print(c);
  endfor
  imshow(I)
endfunction

function retval = averageChunk(X,Y,I)
  denom = 0;
  retval = 0.0;
  for (x = X-1:X+1)
    for (y = Y-1:Y+1)
      
      if (x < rows(I) && x > 0)
        if (y < columns(I) && y > 0)
          retval += uint16(I(x,y));
          denom += 1;
        endif
      endif
      
    endfor
  endfor
 
  retval/=denom;
  retval = uint8(retval);
  
endfunction

function retval = averageCross(X,Y,I)
  denom = 0;
  retval = 0.0;
  
  for (x = X-1:X+1)
    if (x < rows(I) && x > 0)
      retval += uint16(I(x,Y));
      denom += 1;
    endif
  endfor
  
  for (y=Y-1:Y+1:2)
    if(y < columns(I) && y > 0)
      retval += uint16(I(X,y));
      denom += 1;
    endif
  endfor
  
  retval/=denom;
  retval = uint8(retval);
  
endfunction
