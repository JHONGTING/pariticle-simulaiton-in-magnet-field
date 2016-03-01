%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%author   Pjer
%name     step_func
%usage    find the relationship between
%         frequency and acceleration
%date     2016-2-24 22:54:31
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tol=0.0002;
gap_n=[2,5,15,40];
for gap_num=1:4
    figure();
    z_tol=0:tol:300;
    s=get_mag_freq(0.2,gap_n(gap_num),300,0.01,tol);
    ss=normalize_strength(s);
    plot(z_tol,ss);
    title(strcat('normalized magnet field in a certain distance with 0.2~',...
        num2str(gap_n(gap_num)),' frequency'));
    xlabel('X (normalized distance)');
    ylabel('B (normalized magnet field)');
    figure();
    hist(abs(diff(ss)),500);
    title(strcat('normalized change rate of magnet field in a certain distance with 0.2~',...
        num2str(gap_n(gap_num)),' frequency'));
    xlim([0 3e-4]);
end