classdef LinearTimeInvariantPlant < hybrid.subsystems.ContinuousSubsystem
    
    properties
        A
        B
        C
        D
        state_space_model
    end
    
    %%%%%% System Data %%%%%% 
    methods

        function this = LinearTimeInvariantPlant(A, B, C, D)
            assert(size(A, 1) == size(B, 1), "The heights of A and B must match!")
            assert(size(A, 1) == size(A, 2), "Matrix A must be square!")
            if ~exist("C", "var")
                assert(~exist("D", "var"))
                C = eye(size(A));
            end
            if ~exist("D", "var")
                D = zeros(size(C, 1), size(B, 2));
            else
                error("Not implemented")
            end
            
            state_dim = size(A, 1);
            input_dim= size(B, 2);
            output_dim = size(C, 1);
            output = @(x) C*x; %+ D * u;
            this = this@hybrid.subsystems.ContinuousSubsystem(state_dim, input_dim, output_dim, output);
            
            this.A = A;
            this.B = B;
            this.C = C;
            this.D = D;
            
            this.state_space_model = ss(A, B, C, D);
        end
        
        function xdot = flowMap(this, x, u, t, j)  
            xdot = this.A * x + this.B * u;
        end
    end 
end