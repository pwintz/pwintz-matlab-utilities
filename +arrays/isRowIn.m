function [is_member, linear_indices] = isMember(value, array, options)
  % Search for a single value in an array. The outputs are 
  % 1. is_member: 1 if the array contains the value (anywhere) and 0 otherwise. 
  % 2. linear_indices: an array of all of the linear indices where the value occurs.
  arguments(Input)
    value (1, 1);
    array (:, :);
    options.tolerance double {mustBeNonnegative} = 0.0;
  end % End of Input arguments block
  arguments(Output)
    is_member (1, 1) logical {pwintz.validators.mustBeScalar};
    linear_indices (:, :) {mustBeInteger,mustBePositive};
  end % End of Output arguments block
  
  if isfloat(array)
    [~, linear_indices] = ismembertol(value, array, ...
      options.tolerance, ...
      "OutputAllIndices", true, ...
      "DataScale", 1 ... % Use absolute tolerance.
    );
    linear_indices = linear_indices{1}; % Get result as non-cell array.
    is_member = ~isempty(linear_indices);
  else
    error("Not implemented.");
    % [is_member, linear_indices] = ismember(value, array);
    % linear_indices = linear_indices{1}; % Get result as non-cell array.
  end
end % end function