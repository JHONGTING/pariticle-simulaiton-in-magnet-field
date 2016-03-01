particle_size=3000;
phi_0=random('unif',0,pi,[1,41]);
t_delta = 0.001;
vx=random('norm',0,0.1,[1,particle_size]);
vy=random('norm',0,0.1,[1,particle_size]);
vz=random('norm',0,0.1,[1,particle_size])+1;

x=random('norm',0,0.1,[1,particle_size])*100000;
y=random('norm',0,0.1,[1,particle_size])*100000;
z=random('norm',0,0.1,[1,particle_size])*100000;

t=0;
stat_x=zeros(1,8000);
stat_y=zeros(1,8000);
stat_z=zeros(1,8000);
stat_vx=zeros(1,8000);
stat_vy=zeros(1,8000);
stat_vz=zeros(1,8000);


for nnn=1:4000
  
  stat_vx(nnn)=mean(vx);  
  stat_vy(nnn)=mean(vy);  
  stat_vz(nnn)=mean(vz);
  stat_x(nnn)=std(vx);
  stat_y(nnn)=std(vy);
  stat_z(nnn)=std(vz);
  [x,y,z,vx,vy,vz,t]=step_func_static(x,y,z,vx,vy,vz,t,t_delta,phi_0);
  
  if mod(nnn-1,500)==0
      figure(nnn)
      plot(vz,sqrt(vx.^2+vy.^2),'k.');
    
      axis equal
      ylim([0 1]);
      xlim([0.4 1.4]);
      title(strcat('time',num2str((nnn-1)/1000),'(*\Omega t)'))
  end
    
  %%%%%%%%%%%%
  %used for one particle
  %  [kx(nnn+1),ky(nnn+1),kz(nnn+1),kvx(nnn+1),kvy(nnn+1),kvz(nnn+1),t]...
  %      =step_func(kx(nnn),ky(nnn),kz(nnn)...
  %      ,kvx(nnn),kvy(nnn),kvz(nnn),t,t_delta,phi_0);
end
%histogram(sqrt(vx.^2+vy.^2+vz.^2),50,'facecolor',[0.1,0.2,0.7],'edgecolor',[1,1,1]);