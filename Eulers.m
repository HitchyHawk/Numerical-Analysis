function Eulers(popPrey,popPred,t0,t,h)
  xs = [popPrey];
  ys = [popPred];
  
  n = floor((t-t0)/h);
  ts = [t0:h:t];
  
  for (i = 1:n)
    [xs(i+1),ys(i+1)] = velocityTranslate(xs(i),ys(i),ts(i),h);
  endfor
  
  plotting(xs,ys)
endfunction


function [x,y] = velocityTranslate(popPrey,popPred,t,h)
  k = [3,0.002,0.0006,0.5];
  x = popPrey + h*(k(1)*popPrey         - k(2)*popPrey*popPred);
  y = popPred + h*(k(3)*popPrey*popPred - k(4)*popPred        );
endfunction

function plotting(xs,ys)
  figure(1);hold on;
  
  plot(xs,ys,'-m')
  plot(xs(end),ys(end), 'xr')
  ##text(xs(end)+75,ys(end), "END")
  plot(xs(1), ys(1), '*r')
endfunction