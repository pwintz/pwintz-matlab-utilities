function str = sprintmat(valueFormat, matrix, varargin)
% SPRINTMAT - Convert a 2D matrix into a formatted string representation.
%
% Usage:
%   str = sprintmat(matrix, "valueFormat", "%.2f", "columnSep", ",\t", "rowSep", "\n")
%
% Parameters:
%   valueFormat - (string) Format string for values (e.g., '%.2f')
%   columnSep   - (string) Separator between columns (default: ' ')
%   rowSep      - (string) Separator between rows (default: newline)
%
% Returns:
%   str         - Formatted string representation of the matrix

    % Parse inputs
    p = inputParser;
    % addParameter(p, "valueFormat", "%8.4f");
    addParameter(p, "columnSep", " ");
    addParameter(p, "rowSep", newline);
    parse(p, varargin{:});
    opts = p.Results;

    % Validate matrix
    if ndims(matrix) > 2 %#ok<*ISMAT>
        error('sprintmat only supports up to 2D arrays.');
    end

    [rows, cols] = size(matrix);
    parts = strings(rows, cols);  % one string per array entry

    % Generate the strings for each entry, recording the maximum width among all of the strings.
    widestString = 0;
    for i = 1:rows
        for j = 1:cols
            parts(i, j) = sprintf(valueFormat, matrix(i,j));
            widestString = max(widestString, length(parts(i, j)));
        end
    end

    % Pad the strings to make them all the same width.
    for i = 1:rows
      for j = 1:cols
        if length(parts(i, j)) < widestString
          nSpacesToPad = widestString - length(parts(i, j));
          padding = string(repmat(' ', 1, nSpacesToPad));
          parts(i, j) = padding + parts(i, j);
        end
      end
    end

    % Join the entries.
    rowStrings = strings(rows, 1);
    for i = 1:rows
      % Join the columns
      rowStrings(i, 1) = strjoin(parts(i, :), opts.columnSep);
    end

    % Join rows
    str = strjoin(rowStrings, opts.rowSep);
end
