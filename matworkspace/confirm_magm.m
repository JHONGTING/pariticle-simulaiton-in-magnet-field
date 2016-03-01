%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%author   Pjer
%name     step_func
%usage    test whether the magnet moment
%         is conservative
%date     2016-2-18 16:04:41
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function mag=confirm_magm(z,vx,vy,vz,t,phi_0)
    [bbx,bby,bbz]=getmag(z,t,phi_0);
    %normalize
    nbx=bbx/sqrt(bbx^2+bby^2+bbz^2);
    nby=bbx/sqrt(bbx^2+bby^2+bbz^2);
    nbz=bbx/sqrt(bbx^2+bby^2+bbz^2);
    
    %left for v_perpendicular
    kvx=vx-nbx*vx;
    kvy=vy-nby*vy;
    kvz=vz-nbz*vz;
    
    mag=(kvx^2+kvy^2+kvz^2)/sqrt(bbx^2+bby^2+bbz^2);
end