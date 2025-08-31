function mustBeSquare(value)

  if ~ismatrix(value)
      error("Value must be a matrix. Instead its size was %s.", mat2str(size(value)));
  end 
  
  if size(value, 1) ~= size(value, 2)
      error("Value must be a square. Instead its size was %s.", mat2str(size(value)));
  end 

end % end function