function cell_column = mat2cellColumn(array)
  arguments(Input)
    array (:, 1) {mustBeVector};
  end % End of Input arguments block

  cell_column = mat2cell(array, ones(1, numel(array)));
end