function [is_a_column_in_array, linear_indices] = isColumnIn(column, array, options)
  % Search for a single column in an array. The outputs are 
  % 1. is_a_column_in_array: 1 if the array contains the column (anywhere) and 0 otherwise. 
  % 2. linear_indices: an array of all of the linear indices where the column occurs.

  % ` runtests Test_isColumnIn
  
  arguments(Input)
    column (:, :) {pwintz.validators.mustBeColumnVector};
    array (:, :);
    options.tolerance double {mustBeNonnegative} = 0.0;
  end % End of Input arguments block

  arguments(Output)
    is_a_column_in_array (1, 1) logical {pwintz.validators.mustBeScalar};
    linear_indices (:, :) {mustBeInteger,mustBePositive};
  end % End of Output arguments block
  
  if isempty(array)
    is_a_column_in_array = false;
    linear_indices = [];
    return
  end

  pwintz.assertions.assertSameNumRows(column, array);

  n_columns_to_test = size(column, 2);
  assert(n_columns_to_test == 1, "isColumnIn is only implemented for one 'column' column.");
  assert(isfloat(array), "isColumnIn is not implemented for arrays of type %s.", class(array));
  [~, linear_indices] = ismembertol(column', array', ...
    options.tolerance, ...
    "ByRows", true, ...
    "OutputAllIndices", true, ...
    "DataScale", 1 ... % Use absolute tolerance.
  );
  assert(numel(linear_indices) == n_columns_to_test, "isColumnIn: Expected the number of linear indices (%d) to match the number of columns in 'column' (%d).", numel(linear_indices), n_columns_to_test);

  linear_indices = linear_indices{1}; % Get result as non-cell array.

  if linear_indices == 0
    linear_indices = [];
  end
  is_a_column_in_array = ~isempty(linear_indices);
  %   error(");
  %   % [is_a_column_in_array, linear_indices] = ismember(column, array);
  %   % linear_indices = linear_indices{1}; % Get result as non-cell array.
  % end
end % end function