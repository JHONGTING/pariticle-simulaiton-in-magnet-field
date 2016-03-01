%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%author   Pjer
%name     step_func
%usage    normalize the magnet for the 
%         equal of energy to compare 
%         acceleration effect
%date     2016-2-18 16:04:41
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


function mag_serial=normalize_strength(raw_mag)
    mag_serial=raw_mag/mean(raw_mag);
end