function unique_columns = uniqueColumns(array, varargin)
  unique_columns = unique(array', 'rows', varargin{:})';
end