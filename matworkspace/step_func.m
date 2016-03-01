%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%author   Pjer
%name     step_func
%usage    use 4-stage runge kutta to
%         get the next step
%date     2016-1-20 16:44:19
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [fx,fy,fz,fvx,fvy,fvz,ft]=step_func(x,y,z,vx,vy,vz,t,t_delta,phi_0)
    ft=t+t_delta;

    midz=z+t_delta*vz/2;
    tz=z+t_delta*vz;
    
    [bx0,by0,bz0]=getmag(z,t,phi_0);
    [midbx,midby,midbz]=getmag(midz,t+t_delta/2,phi_0);
    [tbx,tby,tbz]=getmag(tz,t+t_delta,phi_0);
    
    %runge kutta algrithm
    K1x=(vy.*bz0-vz.*by0)-(-by0);
    K1y=-(vx.*bz0-vz.*bx0)-bx0;
    K1z=(vx.*by0-vy.*bx0);
    
    
    K2x=((vy+t_delta/2*K1y).*midbz-(vz+t_delta/2*K1z).*midby)-(-midby);
    K2y=-((vx+t_delta/2*K1x).*midbz-(vz+t_delta/2*K1z).*midbx)-midbx;
    K2z=((vx+t_delta/2*K1x).*midby-(vy+t_delta/2*K1y).*midbx);
    
    
    K3x=((vy+t_delta/2*K2y).*midbz-(vz+t_delta/2*K2z).*midby)-(-midby);
    K3y=-((vx+t_delta/2*K2x).*midbz-(vz+t_delta/2*K2z).*midbx)-midbx;
    K3z=((vx+t_delta/2*K2x).*midby-(vy+t_delta/2*K2y).*midbx);
    
    K4x=((vy+t_delta*K3y).*tbz-(vz+t_delta*K3z).*tby)-(-tby);
    K4y=-((vx+t_delta*K3x).*tbz-(vz+t_delta*K3z).*tbx)-tbx;
    K4z=((vx+t_delta*K3x).*tby-(vy+t_delta*K3y).*tbx);
    
    fvx=vx+t_delta*(K1x+K2x+K3x+K4x)/6;
    fvy=vy+t_delta*(K1y+K2y+K3y+K4y)/6;
    fvz=vz+t_delta*(K1z+K2z+K3z+K4z)/6;
    
    fx=x+t_delta*(fvx+vx)/2;
    fy=y+t_delta*(fvy+vy)/2;
    fz=z+t_delta*(fvz+vz)/2;
end