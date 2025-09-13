function mustBeColumnVector(value)
  if ~iscolumn(value)
    error("Value must be a column vector. Instead its size was %s.", mat2str(size(value)));
  end
end % end function