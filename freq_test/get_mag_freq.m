%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%author   Pjer
%name     get_mag_freq
%usage    used to get the magnet field
%         model for further calculate
%date     2016-2-25
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function mag_serise=get_mag_freq(min_freq,max_freq,length_z,step_freq,step_z)

    z_direction=0:step_z:length_z;
    omega_s=min_freq:step_freq:max_freq;
    phi_0=random('unif',0,2*pi,[1,length(omega_s)]);
    Bj=omega_s.^(-5/3);
    bx=0;
    by=0;
    
    for nn=1:length(omega_s)
        bx=bx+(Bj(nn)*cos(omega_s(nn)*z_direction+phi_0(nn)));
        by=by+(Bj(nn)*sin(omega_s(nn)*z_direction+phi_0(nn)));
    end
    
    bx=bx/length(omega_s);
    by=by/length(omega_s);
    
    mag_serise=bx.^2+by.^2;
end