classdef mylink
    %mylink 自定义的一个连杆类，用来存放D-H参数
    %   此处显示详细说明
    
    properties
        alpha % 连杆扭转角
        a     % 连杆长度
        d     % 连杆偏距
        theta % 关节角
        isrevolute % 是转动关节还是移动关节
    end
    
    methods
        function obj = mylink(alpha_,a_, d_, theta_, isrevolute_)
            % 构造函数
            %   利用此函数初始化类对象
            obj.alpha = alpha_;
            obj.a = a_;
            obj.d = d_;
            obj.theta = theta_;
            if isrevolute_ == 1 || isrevolute == 0
                obj.isrevolute = isrevolute_;
            else
                error('Arg isrevolute of mylink constructor must be 0 or 1');
            end
        end
        
        function T = transMatrix(self,value)
            %transMatrix 计算此连杆的齐次变换矩阵
            sa = sin(self.alpha);
            ca = cos(self.alpha);
            if self.isrevolute == 1
                st = sin(value); ct = cos(value);
                dd = self.d;
            else
                st = sin(self.theta); ct = cos(self.theta);
                dd = value;
            end % 判断是否是转动关节
            % 计算齐次变换矩阵
            T = [ ct    -st    0    self.a
                 st*ca  ct*ca  -sa  -sa*dd
                 st*sa  ct*sa  ca   ca*dd
                  0      0     0      1  ];
        end % function transMatrix
    end
end

