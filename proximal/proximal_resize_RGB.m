function out = proximal_resize_RGB(img, p, q)
    % =========================================================================
    % Redimensioneaza imaginea img astfel încât aceasta save fie de dimensiune p x q.
    % Imaginea img este colorata.
    % =========================================================================
    
    % TODO: Extrage canalul rosu al imaginii.
    img_r = img(:,:,1);
    
    % TODO: Extrage canalul verde al imaginii.
    img_g = img(:,:,2);
    
    % TODO: Extrage canalul albastru al imaginii.
    img_b = img(:,:,3);
    
    % TODO: Aplica functia proximal pe cele 3 canale ale imaginii.
    res_img_r = proximal_resize(img_r , p , q);
    res_img_g = proximal_resize(img_g , p , q);
    res_img_b = proximal_resize(img_b , p , q);
    
    % TODO: Formeaza imaginea finala concatenând cele 3 canale de culori.
    out(:,:,1) = res_img_r;
    out(:,:,2) = res_img_g;
    out(:,:,3) = res_img_b;

endfunction
