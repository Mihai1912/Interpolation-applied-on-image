function out = proximal_2x2_RGB(img, STEP = 0.1)
    % ==============================================================================================
    % Aplica Interpolare Proximala pe imaginea 2 x 2 definita img cu puncte intermediare echidistante.
    % img este o imagine colorata RGB -Red, Green, Blue.
    % =============================================================================================

    % TODO: Extrage canalul rosu al imaginii.
    img_r = img(:,:,1);
    
    % TODO: Extrage canalul verde al imaginii.
    img_g = img(:,:,2);
    
    % TODO: Extrage canalul albastru al imaginii.
    img_b = img(:,:,3);
    
    % TODO: Aplic? functia proximal pe cele 3 canale ale imaginii.
    out_r = proximal_2x2(img_r , STEP);
    out_g = proximal_2x2(img_g , STEP);
    out_b = proximal_2x2(img_b , STEP);
    
    % TODO: Formeaza imaginea finala concatenând cele 3 canale de culori.
    out(:,:,1) = out_r(:,:);
    out(:,:,2) = out_g(:,:);
    out(:,:,3) = out_b(:,:);
    
endfunction
