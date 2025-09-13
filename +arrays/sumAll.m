function total = sumAll(matrix)
  arguments(Input)
    matrix (:, :) double;
  end % End of Input arguments block
  arguments(Output)
    total (1, 1) double {mustBeScalarOrEmpty,mustBeNonempty};
  end % End of Output arguments block

  total = sum(matrix, "all");
end % end function