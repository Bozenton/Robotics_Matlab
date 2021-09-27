function R = eulerzyx2rotm(alpha, beta, gamma, deg)
%eulerzyx2rotm 通过Z-Y-X欧拉角，得到旋转矩阵

    Rz = rotationz(alpha, deg);
    Ry = rotationy(beta, deg);
    Rx = rotationx(gamma, deg);
    
    R = Rz * Ry * Rx;
end

