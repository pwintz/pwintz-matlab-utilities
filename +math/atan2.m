function out = atan2(varargin)
  
  switch nargin()
    case 1
      if isempty(varargin{1})
        out = double.empty(size(varargin{1}));
        return
      end

      x = varargin{1};
      pwintz.assertions.assertNumRows(x, 2);
      % assert(size(x, 1) == 2, "When pwintz.math.atan2 is passed one argument, it must have %d rows, but instead had %d.", 2, size(x, 1));
      % assert(iscolumn(x), 'when pwintz.math.atan2 has only one argument, it must be a column vector with two entries.');
      % assert(numel(x) == 2, 'when pwintz.math.atan2 has only one argument, it must be a column vector with two entries.');
      out = atan2(x(2, :), x(1, :));
    case 2
      x1 = varargin{1};
      x2 = varargin{2};
      assert(all(size(x1) == size(x2)), ...
        "size(x1)=%s must equal size(x2)=%s}", mat2str(size(x1)), mat2str(size(x2)));

      if isempty(x1)
        out = double.empty(size(varargin{1}));
        return
      end

      out = atan2(x2, x1);
    otherwise
      error("pwintz.math.atan2 expected 1 or 2 arguments. Instead had %d", nargin());
  end
end