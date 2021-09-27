function T = translation(x, y, z)
%translate 根据输入的x, y, z，输出相应的平移齐次变换矩阵

    t = [x; y; z];
    T = [eye(3) t;
        0 0 0 1];
end

