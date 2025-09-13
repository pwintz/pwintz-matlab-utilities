function is_all = allPerColumn(array)
  arguments(Output)
    is_all (1, :) logical;
  end % End of Output arguments block
  
  % In each column, check if every value is truthy values . 
  dim = 1;
  is_all = all(array, dim); 

  pwintz.assertions.assertSize(is_all, [1, size(array, 2)]);
end % end function