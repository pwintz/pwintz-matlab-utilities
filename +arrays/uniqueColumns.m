function unique_columns = uniqueColumns(array, varargin)
  [unique_rows, src_ndxs_cell, out_rows_ndxs_cell] =  pwintz.arrays.uniqueRows(array', varargin{:});
  unique_columns = unique_rows';
end