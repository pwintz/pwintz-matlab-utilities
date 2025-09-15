function assertAllFinite(values, context, context_args, options)
  arguments(Input)
    values (:, :);
    context (1, 1) string = "";
  end % End of Input arguments block
  
  arguments(Input, Repeating)
    context_args;
  end % End of Input arguments block

  arguments(Input)
    options.name  = [];
  end % End of Input arguments block
  
  context = "All of the values must be finite. %D";
  context_args = {values};
  pwintz.assertions.assertAll(isfinite(values), context, context_args{:}, name=options.name);

end % end function

