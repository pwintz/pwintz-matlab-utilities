function array_without_column = findAndRemoveColumn(col_vector, array, options)

  % ` runtests Test_findAndRemoveColumn
  arguments(Input)
    col_vector (:, 1) {mustBeNumeric};
    array      (:, :) {mustBeNumeric};
    options.tolerance (1, 1) {mustBeNonnegative} = 0.0;
    options.verbose logical = false;
  end % End of Input arguments block
  % arguments(Input, Repeating)
  %   varargin cell; % Optional arguments to pass to findRowIn.
  % end % End of Input arguments block
  
  % assert(iscolumn(col_vector), '"col_vector" must be a column vector.');
  assert(size(col_vector, 1) == size(array, 1), 'The height of the arrays must match. The height of col_vector is %s and the height of array is %s.', mat2str(size(col_vector)), mat2str(size(array)));

  col_ndxs_to_rm = pwintz.arrays.findColumnIn(col_vector, array, tolerance=options.tolerance, verbose=options.verbose);
  col_ndxs_to_keep = setdiff(1:size(array, 2), col_ndxs_to_rm);
  array_without_column = array(:, col_ndxs_to_keep);


  % if options.verbose
  %   fprintf("Searched for the column vector %s in the array %s with tolerance %.2g.\n", mat2str(col_vector, 10), mat2str(array, 10), options.tolerance);
  %   col_errors = vecnorm(col_vector - array);
  %   if isempty(col_ndxs)
  %     fprintf('The column was not found in the array. The closest column in array was a distance of %.2g\n', min(col_errors));
  %   else
  %     fprintf('The column was found at indices %s. The error of the found terms was %s.\n', mat2str(col_ndxs), mat2str(col_errors(col_ndxs)));
  %   end
  % end
end % end function