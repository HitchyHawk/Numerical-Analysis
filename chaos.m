##r>3 has chaotic behavior
##with p0 (the starting position) creating variable amounts of chaos
##N is the amount of steps taken before stoping
function chaos(r,p0,N)
  x=0:0.01:1;
  hold all
  
  plot(x,f(x,r),'r');
  plot(x,x,'b')
  plot(p0,f(p0,r),'og',"markersize", 10)
  
 
  n=1:N
  
  for (i = 1:N)
    p(i)=p0;
    ##horizontal
    
    
    line([p0 f(p0,r)], [f(p0,r) f(p0,r)],'linestyle','-','color','k');
    ##vertical
    
    line([f(p0,r), f(p0,r)], [f(p0,r), f(f(p0,r),r)],'linestyle','-','color','k')
    p0=f(p0,r);
    
    
  endfor
  ##plot(n,p,'--xk');
  plot(p0,f(p0,r),'or',"markersize", 10)
endfunction

function y = f(x,r)
  y = -r*x.*(x-1);
endfunction