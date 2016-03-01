%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%author   Pjer
%name     getmag
%usage    get the magnet field of the 
%         point at x,y,z,t   
%         [the input should be a point]
%date     2016-1-20 16:44:19
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [bx,by,bz]=getmag(z,t,phi_0)
    bz=ones(1,length(z));
    omega_s=0.01:0.001:0.05;
    Bj=omega_s.^(-5/3);
    bx=0;
    by=0;
    
    for nn=1:length(omega_s)
        bx=bx+(Bj(nn)*cos(omega_s(nn)*t-omega_s(nn)*z+phi_0(nn)));
        by=by+(Bj(nn)*sin(omega_s(nn)*t-omega_s(nn)*z+phi_0(nn)));
    end
    
    bx=bx/length(omega_s)/1200;
    by=by/length(omega_s)/1200;
end