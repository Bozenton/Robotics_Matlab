function T = trotationx(t,deg)
%trotationx 绕着x轴旋转的齐次变换矩阵

    R = rotationx(t, deg);
    p = zeros(3,1);
    T = [R p;
        0 0 0 1];
end

