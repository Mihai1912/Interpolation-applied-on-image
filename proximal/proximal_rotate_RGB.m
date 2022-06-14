function out = proximal_rotate_RGB(img, rotation_angle)
    % =========================================================================
    % Aplica Interpolarea Proximala pentru a roti o imagine RGB cu un unghi dat.
    % =========================================================================
    
    % TODO: Extrage canalul rosu al imaginii.
    img_r = img(:,:,1);
    
    % TODO: Extrage canalul verde al imaginii.
    img_g = img(:,:,2);
    
    % TODO: Extrage canalul albastru al imaginii.
    img_b = img(:,:,3);
    
    % TODO: Aplica rotatia pe fiecare canal al imaginii.
    img_rot_r = proximal_rotate(img_r , rotation_angle);
    img_rot_g = proximal_rotate(img_g , rotation_angle);
    img_rot_b = proximal_rotate(img_b , rotation_angle);
    
    % TODO: Formeaza imaginea finala concatenând cele 3 canale de culori.
    out(:,:,1) = img_rot_r;
    out(:,:,2) = img_rot_g;
    out(:,:,3) = img_rot_b;
    
endfunction