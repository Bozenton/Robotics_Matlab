function T = trotationz(t,deg)
%trotationz 绕着z轴旋转的齐次变换矩阵
    R = rotationz(t, deg);
    p = zeros(3,1);
    T = [R p;
        0 0 0 1];
end

