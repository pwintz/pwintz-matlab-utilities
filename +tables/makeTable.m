function out = makeTable(columnName, columnValues, options)


  arguments(Input,Repeating)
    columnName (1, :) char;
    columnValues (:, :) ;
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

  if ~are_all_columns_same_length
    for i_col = 1:num_cols
      col = columnValues{i_col};
      if size(col, 1) ~= num_rows
        error("Column ""%s"" did not have the expected number of rows. Instead of %d rows it had %d", columnName{i_col}, num_rows, size(col, 1));
      end
    end
  end
  
  out = table(columnValues{:}, 'VariableNames', columnName);

end % end function