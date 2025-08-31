function mustBeScalar(value)
  if numel(value) ~= 1
    error("Value must be a scalar. Instead its size was %s.", mat2str(size(value)));
  end
end % end function