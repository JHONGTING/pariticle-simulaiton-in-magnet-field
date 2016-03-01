particle_size=1;
phi_0=random('unif',0,pi,[1,41]);
t_delta = 0.001;
vx=random('norm',0,0.1,[1,particle_size]);
vy=random('norm',0,0.1,[1,particle_size]);
vz=random('norm',0,0.1,[1,particle_size])+1;

x=random('norm',0,0.1,[1,particle_size])*100000;
y=random('norm',0,0.1,[1,particle_size])*100000;
z=random('norm',0,0.1,[1,particle_size])*100000;

t=0;
k_x=zeros(1,5000000);
k_y=zeros(1,5000000);
k_z=zeros(1,5000000);
k_vx=zeros(1,5000000);
k_vy=zeros(1,5000000);
k_vz=zeros(1,5000000);

[k_x(1),k_y(1),k_z(1),k_vx(1),k_vy(1),k_vz(1),t]=step_func_static(x,y,z,vx,vy,vz,t,t_delta,phi_0);
  
for nnn=1:5000000
  
    
    [k_x(nnn+1),k_y(nnn+1),k_z(nnn+1),k_vx(nnn+1),k_vy(nnn+1),k_vz(nnn+1),t]...
        =step_func_static(k_x(nnn),k_y(nnn),k_z(nnn)...
        ,k_vx(nnn),k_vy(nnn),k_vz(nnn),t,t_delta,phi_0);
    if mod(nnn,5)==0
    m(nnn/5)=confirm_magm(k_z(nnn+1),k_vx(nnn+1),k_vy(nnn+1),k_vz(nnn+1),t,phi_0);
    end
end
%histogram(sqrt(vx.^2+vy.^2+vz.^2),50,'facecolor',[0.1,0.2,0.7],'edgecolor',[1,1,1]);