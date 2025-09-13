function mustBeScalar(value)
  if ~isscalar(value)
    error("Value must be a scalar. Instead its size was %s.", mat2str(size(value)));
  end
end % end function