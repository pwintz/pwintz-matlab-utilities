function out = atan2(varargin)
  % Compute the angle for a given 
  % * 2x1 column vector          atan2([x; y])
  % * 1x2 row vector             atan2([x, y])
  % * tall array of row vectors  atan2([x1, y1; x2, y2; ...; xn, yn]) 
  % * (x, y)-pair:               atan2(x, y)
  % * (x, y)-array:              atan2([x11, x12; x21, x22], [y11, y12; y21, y22])
  % If one argument is given, treat the first column as 'x' values and second column as 'y' values or, if the input is a vector, simply treat the first entry as 'x' and the second entry as 'y'
  % TODO: I should rename this function becuase it doesn't match the behavior of MATLAB's built-in atan2 function. Perhaps "angle" would be good. 
  switch nargin()
    case 1 % If one argument is given, treat the first column as 'x' values and second column as 'y' values or, if the input is a vector, simply treat the first entry as 'x' and the second entry as '
      if isempty(varargin{1})
        % If the input is an empty array, then we return an empty array of the same size.
        out = double.empty(size(varargin{1}));
        return
      end

      x = varargin{1};
      pwintz.assertions.assertNumRows(x, 2);
      % assert(size(x, 1) == 2, "When pwintz.math.atan2 is passed one argument, it must have %d rows, but instead had %d.", 2, size(x, 1));
      % assert(iscolumn(x), 'when pwintz.math.atan2 has only one argument, it must be a column vector with two entries.');
      % assert(numel(x) == 2, 'when pwintz.math.atan2 has only one argument, it must be a column vector with two entries.');
      
      % Use the built-in atan2 function to compute the angle.
      out = atan2(x(2, :), x(1, :));
    case 2
      x1 = varargin{1};
      x2 = varargin{2};
      assert(all(size(x1) == size(x2)), ...
        "size(x1)=%s must equal size(x2)=%s}", mat2str(size(x1)), mat2str(size(x2)));

      if isempty(x1)
        assert(isempty(x2), 'if x1 is empty, then x2 must also be empty.');
        out = double.empty(size(varargin{1}));
        return
      end

      % Use the built-in atan2 function to compute the angle.
      out = atan2(x2, x1);
    otherwise
      error("pwintz.math.atan2 expected 1 or 2 arguments. Instead had %d", nargin());
  end
end