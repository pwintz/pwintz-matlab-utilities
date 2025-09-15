function column_mins = minColumns(matrix)
  arguments(Input)
    matrix (:, :) double;
  end % End of Input arguments block
  arguments(Output)
    column_mins (1, :) double;
  end % End of Output arguments block

  along_dim = 1;
  column_mins = min(matrix, [], along_dim);
end % end function