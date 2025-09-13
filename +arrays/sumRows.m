function row_sums = sumRows(matrix)
  arguments(Input)
    matrix (:, :) double;
  end % End of Input arguments block
  arguments(Output)
    row_sums (:, 1) double;
  end % End of Output arguments block

  along_dim = 2;
  row_sums = sum(matrix, along_dim);
end % end function