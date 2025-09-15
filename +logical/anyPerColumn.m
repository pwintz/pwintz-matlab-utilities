function is_any = anyPerColumn(array)
  % Test each column of array for whether any value is truthy. 
  % The output is a row vector of the same width as array. 
  % 
  % If array is 0xn (empty with nonzero number of rows), then the result is a 1xn row vector "false". 
  arguments(Output)
    is_any (1, :) logical;
  end % End of Output arguments block
  
  % In each column, check if every value is truthy values . 
  dim = 1;
  is_any = any(array, dim); 

  pwintz.assertions.assertSize(is_any, [1, size(array, 2)]);
end % end function