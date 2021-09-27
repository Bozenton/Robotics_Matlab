function eul = rotm2eulerzyx(R)
%rotm2eulerzyx 根据旋转矩阵得到欧拉角
    
    if sum(size(R) == 3) ~= 2
        error('Error. Input must be a 3x3 matrix.');
    end
    
    eul = zeros(1,3);
    if abs(R(1,1)) < eps && abs(R(2,1)) < eps
        % 此时是奇异的
        if R(3,1)<0 % r31=-sin(beta)<0,说明beta=90度
            eul(2) = pi/2;
            eul(1) = 0;
            eul(3) = atan2(R(1,2), R(2,2));
        else 
            eul(2) = -pi/2;
            eul(1) = 0;
            eul(3) = -atan2(R(1,2), R(2,2));
        end
    else
        % 此时非奇异
        beta = atan2(-R(3,1), sqrt(R(1,1)^2 + R(2,1)^2));
        eul(1) = atan2(R(2,1)/cos(beta), R(1,1)/cos(beta));
        eul(2) = beta;
        eul(3) = atan2( R(3,2)/cos(beta), R(3,3)/cos(beta) );
    end
end

