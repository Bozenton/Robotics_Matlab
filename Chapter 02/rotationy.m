function R = rotationy(t,deg)
%rotationy 绕着y轴旋转的旋转矩阵
%   t   为旋转角度
%   deg 为是否使用角度，若为'deg'，则gamma应为角度
%       否则为弧度

    % 检查输入格式
    assert((isreal(t) & isscalar(t)) | isa(t, 'sym'), ...
        'SMTB:rotx:badarg', 'theta must be a real scalar');
    
    % 检查输入是弧度值还是角度值
    if nargin > 1 && strcmp(deg, 'deg')
        t = t * pi/ 180;
    end
    
    ct = cos(t);
    st = sin(t);
    
    % 对于那些很小的值，直接算作0
    if ~isa(t,'sym')
        if abs(st)<eps
            st = 0;
        end
        if abs(ct)<eps
            ct = 0;
        end
    end
    
    % 得到旋转矩阵
    R = [
        ct  0   st
        0   1   0
       -st  0   ct
       ];
end

