function r = fx(f, x, y)
    % =========================================================================
    % Aproximeaza derivata fata de x a lui f in punctul (x, y).
    % =========================================================================
    r = (f(x+1, y) - f(x-1, y))/2;
    % TODO: Calculeaza derivata.

endfunction