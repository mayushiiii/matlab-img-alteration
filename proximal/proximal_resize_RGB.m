function out = proximal_resize_RGB(img, p, q)
    % =========================================================================
    % Redimensioneaza imaginea img astfel încât aceasta save fie de dimensiune p x q.
    % Imaginea img este colorata.
    % =========================================================================

    % TODO: Extrage canalul rosu al imaginii.
    r = img(:,:,1);
    % TODO: Extrage canalul verde al imaginii.
    g = img(:,:,2);
    % TODO: Extrage canalul albastru al imaginii.
    b = img(:,:,3);
    % TODO: Aplica functia proximal pe cele 3 canale ale imaginii.
    p_r = proximal_resize(r, p, q);
    p_g = proximal_resize(g, p, q);
    p_b = proximal_resize(b, p, q);
    % TODO: Formeaza imaginea finala concatenând cele 3 canale de culori.
    out = cat(3, p_r, p_g, p_b);
    
endfunction
