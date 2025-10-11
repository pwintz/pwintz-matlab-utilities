function jacb = jacobian(f, x, sparsity_pattern)

h = sqrt(eps);

f_center = f(x);

rows = length(x);
cols = length(f_center);

jacb = zeros(rows, cols);

h_vec = 0*x;

if exist('sparsity_pattern', 'var')
    h_vec(i) = h;

        grad_f = (f(x + h_vec) - f(x - h_vec)) / (2*h);

    % %      norm(grad_f, "inf")
    %     if norm(grad_f, "inf") > 1e5
    % %         grad_f = (f(x) - f(x - h_vec)) / (h);
    % %             warning("Large norm. Switching to backward finite difference")
    % %         if norm(grad_f, "inf") > 1e2
    % %             
    % %             grad_f = (f(x + h_vec) - f(x)) / (h);
    % %             warning("Large norm. Switching to backward finite difference")
    % %             
    % %             if norm(grad_f, "inf") > 1e2
    % %                 error("Large norm. Aborting.")
    % %             end
    % 
    %         figure()
    %         for h = -2:0.1:2
    %             h_vec(i) = h;
    %             val = f(x + h_vec);
    %             plot(h, val, "*")
    %             hold on
    %         end 
    %         1;
    %     end

        jacb(i, :) = grad_f';

        h_vec(i) = 0;
    %     end
%     end

else % no sparsity_pattern

    for i = 1:rows

        h_vec(i) = h;

%         grad_f = (f(x + h_vec) - f(x - h_vec)) / (2*h);
        grad_f = (f(x + h_vec) - f_center) / h;

    % %      norm(grad_f, "inf")
    %     if norm(grad_f, "inf") > 1e5
    % %         grad_f = (f(x) - f(x - h_vec)) / (h);
    % %             warning("Large norm. Switching to backward finite difference")
    % %         if norm(grad_f, "inf") > 1e2
    % %             
    % %             grad_f = (f(x + h_vec) - f(x)) / (h);
    % %             warning("Large norm. Switching to backward finite difference")
    % %             
    % %             if norm(grad_f, "inf") > 1e2
    % %                 error("Large norm. Aborting.")
    % %             end
    % 
    %         figure()
    %         for h = -2:0.1:2
    %             h_vec(i) = h;
    %             val = f(x + h_vec);
    %             plot(h, val, "*")
    %             hold on
    %         end 
    %         1;
    %     end

        jacb(i, :) = grad_f';

        h_vec(i) = 0;
    end
end
    
end