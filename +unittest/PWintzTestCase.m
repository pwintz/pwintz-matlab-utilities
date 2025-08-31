classdef PWintzTestCase < matlab.unittest.TestCase
  
  methods

    function out = assertTruthy(testCase, value)
      class(value)
      TrueFalseIndeterminate.false.char()
      value
      class(value)
      value.char()
      value.logical();
      if logical(TrueFalseIndeterminate.true)
        % OK
      else
        testCase.fatalAssertFail("The value of " + value + " is not truthy.");
      end
      
    end % End of function

  end % End of methods



end % End of class