function mustBeIndexVector(value)
  if ~isnumeric(value)
    pwintz.error("Value must be an integer, instead it was a %s: %D", class(value), value)
  end
  mustBeInteger(value);
  mustBePositive(value);
  mustBeVector(value);
end % end function