classdef Exception < MException
  methods
    function this = Exception(msg_id, msg_format, varargin)
      msg = pwintz.strings.format(msg_format, varargin{:});
      this@MException(msg_id, msg);
    end % End of constructor
  end % End of methods
end % End of class