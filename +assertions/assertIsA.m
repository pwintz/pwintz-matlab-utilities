function assertIsA(value, type_str, options)
  arguments(Input)
    value; 
    % Class name or numeric data type ("numeric", "float", "integer")
    type_str string;
    options.name string = "";
  end % End of Input arguments block
  
  
  if ~isa(value, type_str)
    % Generate a name for the left argument.
    value_name = options.name; 
    if value_name == ""
      value_name = inputname(1);
    end
    % The input names may be empty, if the caller passed an expression instead of a single variable.
    if value_name == "" || isempty(value_name)
        value_name = "<value>";
    else 
      value_name = """" + value_name + """";
    end

    error("Expected\n\t%s = %s\nto be type ""%s"". Instead is type ""%s"".", value_name, pwintz.strings.anything2shortString(value), type_str, class(value));
  end
end % end function