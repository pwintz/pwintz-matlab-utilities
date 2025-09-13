function mustBeRowVector(value)
  if ~isrow(value)
    error("Value must be a row vector. Instead its size was %s.", mat2str(size(value)));
  end
end % end function