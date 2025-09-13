function ndxs = cellVectorIndices(cell_array)
  % Get the indices of a vector cell array, for in for-loops like 
  % `  
  % `  for ndx = cellVectorIndices(my_array)
  % `     ele = my_array(ndx)
  % `  end 

  if ~iscell(cell_array)
    error(pwintz.strings.format("Expected ""cell_array"" to be a cell array. Instead its type was %s.", class(cell_array)));
  end
  assert(isvector(cell_array), "Expected ""cell_array"" to be 1-dimensional. Instead its size was %s.", mat2str(size(cell_array)));
  ndxs = 1:numel(cell_array);

end % end function