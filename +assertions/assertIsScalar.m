function assertIsScalar(value)
  if ~isscalar(value)
    value_name = inputname(1);
    if ~isempty(value_name)
      error("The value '%s' must be a scalar instead had shape %s", value_name, mat2str(size(value)));
    else
      error("Value must be a scalar instead had shape %s", mat2str(size(value)));
    end
  end
end % end function