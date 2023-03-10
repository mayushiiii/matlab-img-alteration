function out = bicubic_resize_RGB(img, p, q)
    % =========================================================================
    % Redimensioneaza imaginea img astfel �nc�t aceasta save fie de dimensiune p x q.
    % Imaginea img este colorata.
    % =========================================================================

    % TODO: Extrage canalul rosu al imaginii.
    r = img(:,:,1);
    % TODO: Extrage canalul verde al imaginii.
    g = img(:,:,2);
    % TODO: Extrage canalul albastru al imaginii.
    b = img(:,:,3);
    % TODO: Aplica functia bicubic pe cele 3 canale ale imaginii.
    p_r = bicubic_resize(r, p, q);
    p_g = bicubic_resize(g, p, q);
    p_b = bicubic_resize(b, p, q);
    % TODO: Formeaza imaginea finala concaten�nd cele 3 canale de culori.
    out = cat(3, p_r, p_g, p_b);
endfunction
