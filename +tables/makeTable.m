function out = makeTable(columnName, columnValues, options)
  % ` runtests Test_makeTable

  arguments(Input,Repeating)
    columnName (1, 1) string;
    columnValues (:, :);
  end % End of Input arguments block

  arguments(Input)
    options.NumRows = [];
  end % End of Input arguments block

  num_cols = numel(columnValues);
  if isempty(options.NumRows)
    num_rows = size(columnValues{1}, 1);
  else
    num_rows = options.NumRows;
  end
  % options.NumRows
  % columnName
  % columnValues
  column_lengths = cellfun(@(column) size(column, 1), columnValues);
  are_all_columns_same_length = all(diff(column_lengths)  == 0);

  % if ~are_all_columns_same_length
  %   
  % end

  % ╭──────────────────────────────────────────────────────────╮
  % │             Check the lengths of each column             │
  % ╰──────────────────────────────────────────────────────────╯
  if ~are_all_columns_same_length
    for i_col = 1:num_cols
      column = columnValues{i_col};
      if size(column, 1) ~= num_rows
        err = pwintz.Exception("pwintz:makeTable", "Column ""%s"" (%z) did not have the expected number of rows. Instead of %d rows it had %d.\n%D", columnName{i_col}, column, num_rows, size(column, 1), column);
        throw(err);
      end
    end
  end
  
  columnName = cellfun(@(str) char(str), columnName, "UniformOutput", false);
  assert(isvector(columnName), "columnName must be a vector.");
  out = table(columnValues{:}, 'VariableNames', columnName);

end % end function