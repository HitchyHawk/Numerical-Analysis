## VectorFG([x1,x2],[y1,y2],divisions,MAXSPEED)
##MAXSPEED = 0 for no color, only black arrows
function VectorFG(xRange,yRange,divisions,MAXSPEED)
  xSpace = (xRange(2)-xRange(1))/divisions;
  ySpace = (yRange(2)-yRange(1))/divisions;
  
  if (xSpace <= ySpace)
    r = xSpace/2;
  else 
    r = ySpace/2;
  endif
  for (i = 0:divisions)
    x0 = xRange(1)+xSpace*i;
    for (j = 0:divisions)
      y0 = yRange(1)+ySpace*j;
      [vx,vy] = Field(x0,y0);
      draw(x0,y0,vx,vy,r,MAXSPEED);
    endfor
  endfor
  
endfunction


function draw(x0,y0,vx,vy,r,MAXSPEED)
  figure(1); hold on; 
  if (vx == 0&& vy == 0 )
    plot(x0,y0,'*k');
    return
  endif
  mag = (vx^2+vy^2)^(1/2);
  
  
  #sizes the body properly
  if (mag > r)
    bx = vx*r/mag;
    by = vy*r/mag;
    
  else
    bx = vx;
    by = vy;
    
  endif
  
  bodyX=[x0, x0+bx];
  bodyY=[y0, y0+by];
  
  
  if (mag >= MAXSPEED)
    plot(bodyX,bodyY, '-k')
    plot(bodyX(1),bodyY(1),'*k')
  elseif (mag >= MAXSPEED*3/4)
    plot(bodyX,bodyY, '-r')
    plot(bodyX(1),bodyY(1),'*r')
    
  elseif (mag >= MAXSPEED*2/4)
    plot(bodyX,bodyY, '-b')
    plot(bodyX(1),bodyY(1),'*b')
    
  elseif (mag >= MAXSPEED*1/4)
    plot(bodyX,bodyY, '-g')
    plot(bodyX(1),bodyY(1),'*g')
    
  elseif (mag > 0)
    plot(bodyX,bodyY, '-c')
    plot(bodyX(1),bodyY(1),'*c')
  endif
  
endfunction

##The field function, adjust at will
function [vx,vy] = Field(x0,y0)
  vx = 1;
  vy = y0+x0+1;
endfunction