function cell_row = mat2cellRow(array)
  arguments(Input)
    array (1, :) {mustBeVector};
  end % End of Input arguments block

  cell_row = transpose(pwintz.arrays.mat2cellColumn(array));
end