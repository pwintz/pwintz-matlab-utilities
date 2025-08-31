function mustBeIndexScalar(value)
  mustBeInteger(value);
  mustBePositive(value);
  pwintz.validators.mustBeScalar(value);
end % end function