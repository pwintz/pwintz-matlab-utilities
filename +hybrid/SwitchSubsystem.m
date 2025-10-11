classdef SwitchSubsystem < HybridSubsystem
% Hybrid subsystems for switching the output between two input values.
% 
% This subsystem takes an input [u0; u1; q] where u0 and u1 are vectors with
% dimension p and q is a scalar equal to 0 or 1. If q is equal to 0, then the
% output of this subsystem is u0 and if q=1, then the output is u1.
% 
% Added in HyEQ Toolbox version 3.0.

% Written by Paul K. Wintz, Hybrid Systems Laboratory, UC Santa Cruz (©2022). 
    properties(GetAccess = private, SetAccess = immutable)
        u0_input_indices
        u1_input_indices
        q_input_index
    end
    
    methods
        function obj = SwitchSubsystem(switched_input_dimension)
            p = switched_input_dimension;
            in_dim     = 2*p + 1;
            out_dim    = p;
            u0_input_indices = 1:p;
            u1_input_indices = p + (1:p);
            q_input_index    = 2*p + 1;
            
            function y = output(q, u)
                switch q
                    case 0
                        y = u(u0_input_indices);
                    case 1
                        y = u(u1_input_indices);
                    otherwise
                        error('q=%.8g was not 0 or 1.', q)
                end
            end
            
            state_dim = 1;
            obj = obj@HybridSubsystem(state_dim, in_dim, out_dim, @(q, u) output(q, u));
            obj.u0_input_indices = u0_input_indices;
            obj.u1_input_indices = u1_input_indices;
            obj.q_input_index = q_input_index;
        end       
        
        function u = wrapInput(~, u0, u1, q)
            u = [u0; u1; q];
        end
        
        function [u0, u1, q] = unwrapInput(this, u)
            u0 = u(this.u0_input_indices);
            u1 = u(this.u1_input_indices);
            q  = u(this.q_input_index);
        end
        
        function q_dot = flowMap(this, q, u, t, j) %#ok<INUSD>
            q_dot = 0;
        end

        function q_plus = jumpMap(this, q, u, t, j) %#ok<INUSD,INUSL> 
            
            q_in  = u(this.q_input_index);
            pwintz.assertions.assertAllAreMembers(q_in, [0, 1], tolerance=1e-9)

            % Update the stored value of "q" to match the input value.
            q_plus = q_in;
        end 

        function inC = flowSetIndicator(this, q, u, t, j)  %#ok<INUSD>
            inC = 1;
        end

        function inD = jumpSetIndicator(this, q, u, t, j) %#ok<INUSD>
            % When ever the "q" output is not equal to the "q" state, we switch to the new state.
            inD = q ~= u(this.q_input_index);
        end
    end
    
end