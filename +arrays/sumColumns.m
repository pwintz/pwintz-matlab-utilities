function col_sums = sumColumns(matrix)
  arguments(Input)
    matrix (:, :) double;
  end % End of Input arguments block
  arguments(Output)
    col_sums (1, :) double;
  end % End of Output arguments block

  along_dim = 1;
  col_sums = sum(matrix, along_dim);
end % end function