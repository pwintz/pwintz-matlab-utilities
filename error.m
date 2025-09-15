function error(msg_format, msg_arguments)
  arguments(Input)
    msg_format = "Unspecified error";
  end % End of Input arguments block
  arguments(Input, Repeating)
      msg_arguments;
  end % End of Input arguments block

  msg = pwintz.strings.format(msg_format, msg_arguments{:});

  if msg == ""
    warning("The message for pwintz.error is an empty string, which prevents the error from being raised.");
  end

  error(msg);
end