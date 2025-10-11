function assertLessThan(values, upper_bound, options)
    arguments(Input)
        values (:, :)      {mustBeNumeric};
        upper_bound (1, 1) {mustBeNumeric};
        options.reason (:, 1) string = [];
        options.errorID string = "assertEqual:FAILED";
        options.valuesName string = "";
        options.boundName string = "";
    end % End of Input arguments block
    
    is_value_lt = (values < upper_bound);
    % We put all of the slower operations inside the following if-block, running them only if one of the checks fails.
    if ~all(is_value_lt)
        % ⋘──────── Construct names for the arguments ────────⋙
        % Generate a name for the left argument.
        values_name = options.valuesName; 
        if values_name == ""
          values_name = inputname(1);
        end
        % The input names may be empty, if the caller passed an expression instead of a single variable.
        if values_name == "" || isempty(values_name)
            values_name = "<values>";
        else 
          values_name = """" + values_name + """";
        end
        % Generate a name for the right argument.
        bound_name = options.boundName; 
        if bound_name == ""
          bound_name = inputname(2);
        end
        % The input names may be empty, if the caller passed an expression instead of a single variable.
        if bound_name == "" || isempty(bound_name)
            bound_name = "<upper bound>";
        else 
          bound_name = """" + bound_name + """";
        end

        reasons = options.reason;
        if isnumeric(values)
            values_str = mat2str(values);
        else
            values_str = string(values);
        end
        if isnumeric(upper_bound)
            upper_bound_str = mat2str(upper_bound);
        else
            upper_bound_str = string(upper_bound);
        end
        reasons(end+1) = sprintf("Value mismatch: %s = %s and %s = %s are not equal.", values_name, values_str, bound_name, upper_bound_str);
        exception = MException(options.errorID, "%s and %s are not equal.\n\t%s", values_name, bound_name, join(reasons, sprintf("\n\t")));
        throw(exception);
    end
end