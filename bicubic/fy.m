function r = fy(f, x, y)
    % =========================================================================
    % Aproximeaza derivata fata de y a lui f in punctul (x, y).
    % =========================================================================
    r = (f(x, y+1) - f(x, y-1))/2;
    % TODO: Calculeaza derivata.
    
endfunction