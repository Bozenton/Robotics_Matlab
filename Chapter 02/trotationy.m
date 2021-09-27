function T = trotationy(t,deg)
%trotationy 绕着y轴旋转的齐次变换矩阵

    R = rotationy(t, deg);
    p = zeros(3,1);
    T = [R p;
        0 0 0 1];
end

