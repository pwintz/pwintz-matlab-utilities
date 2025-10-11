classdef ZeroOrderHoldController < HybridSubsystem
% Hybrid subsystems that periodically sample the input to generate a piecewise constant output.
% 
% Constant interpolation is used between sample times. 

% Written by Paul K. Wintz, Hybrid Systems Laboratory, UC Santa Cruz (©2022). 
    properties
        sample_time;
        initial_value;
    end
    
    properties(SetAccess = immutable, GetAccess = private)
        zoh_dim
        zoh_indices
        timer_index
    end
        
    methods
        function obj = ZeroOrderHoldController(zoh_dim, sample_time, control_fnc)
            zoh_dim = int32(zoh_dim);
            state_dim = zoh_dim + 1;
            input_dim = zoh_dim;
            output_dim = zoh_dim;
            output = @(x, ~, ~) control_fnc(x(1:zoh_dim));
            obj = obj@HybridSubsystem(state_dim, input_dim, output_dim, output);
            obj.zoh_dim = zoh_dim;
            obj.zoh_indices = 1:zoh_dim;
            obj.timer_index = zoh_dim + 1;
            obj.sample_time = sample_time;

            % Create an initial condition for the ZOH state and timer.
            obj.initial_value = zeros(input_dim+1, 1);
            obj.initial_value(end) = sample_time;

            obj.initial_value
            initial_output = output(obj.initial_value)
        end

        function u = kappa(this, x)
            u = this.output([], x);
        end
        
        function xdot = flowMap(this, ~, ~, ~, ~)  
            zoh_dot = zeros(this.zoh_dim, 1);
            xdot = [zoh_dot; 1];
        end

        function xplus = jumpMap(~, ~, u, ~, ~) 
            zoh = u;
            xplus = [zoh; 0];
        end

        function C = flowSetIndicator(this, x, u, t, j)  %#ok<INUSD>
            C = 1;
        end

        function D = jumpSetIndicator(this, x, ~, ~, ~)
            timer = x(this.timer_index);
            D = timer >= this.sample_time;
        end
        
        function x0 = initial(this)
            x0 = [zeros(this.input_dimension, 1); this.sample_time];
        end
    end
    
end


