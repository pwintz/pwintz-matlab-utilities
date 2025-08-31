classdef Test_atan2 < matlab.unittest.TestCase
% ! You can run these tests to be run automically via atan2.test() by using the
% ! "runTestsStaticFunction" snippet to add a static method to atan2.m,
%or by running Test_atan2.runTests()

% methods (TestMethodSetup)
%	 function setup(testCase)
%		 % Setup code
%	 end
% end
%
% methods (TestMethodTeardown)
%	 function teardown(testCase)
%		 % Teardown code
%	 end
% end

methods(Static)
  function runTests(varargin) % Define convenience functions for running tests.
    % ⋘──────── Build a list of test strings ────────⋙
    test_class_name =  "Test_atan2";
    if isempty(varargin) 
      % If no arguments given, run all of the tests.
      test_strings = test_class_name;
    else
      % If an argument is given, run construct a list of test functions to run.
      test_strings = cellfun(@(function_name) test_class_name + "/" + function_name, varargin);
    end

    % ⋘──────── Run tests ────────⋙
    results = runtests(test_strings);

    % ⋘──────── Print results ────────⋙
    fprintf(...
      "%d Passed, %d Failed, %d Incomplete.\n", ...
      sum([results.Passed]), sum([results.Failed]), sum([results.Incomplete])...
    );
  end % End of function

end % End static methods block
  % ╭───────────────────────────────────╮
  % │ ╭───────────────────────────────╮ │
  % │ │             Tests             │ │
  % │ ╰───────────────────────────────╯ │
  % ╰───────────────────────────────────╯
  methods (Test)
    
    function Test_atan2_fromVector_single(testCase)
      testCase.assertEqual(pwintz.math.atan2([1; 0]), 0);
    end % End of function.
    
    function Test_atan2_fromVector_multiple(testCase)
      testCase.assertEqual(...
          pwintz.math.atan2([[1; 0], [0; 1], [-1; 0]]), ...
          [0, pi/2, pi], ...
          "AbsTol", 1e-12 ...
      );
    end % End of function.
    
    function Test_atan2_fromComponents_single(testCase)
      testCase.assertEqual(...
          pwintz.math.atan2(0, 1), pi/2, "AbsTol", 1e-12 ...
      );
    end % End of function.
    
    % Check that the function behaves like the builtin atan2 function when there are two arguments given.
    function Test_atan2_fromComponents_multipleInRows(testCase)
      x = [0, 1, 0];
      y = [1, 0, -1];
      testCase.assertEqual(...
          pwintz.math.atan2(y, x), ...
          [0, pi/2, pi], ... % <- output is a row vector 
          "AbsTol", 1e-12 ...
      );
    end % End of function.
    
    function Test_atan2_fromComponents_multipleInColumns(testCase)
      x = [0; 1; 0];
      y = [1; 0; -1];
      testCase.assertEqual(...
          pwintz.math.atan2(y, x), ...
          [0; pi/2; pi], ... % <- output is a column vector  
          "AbsTol", 1e-12 ...
      );
    end % End of function.
    
    function Test_atan2_errorForTwoRowArgument(testCase)
      testCase.assertError(@() pwintz.math.atan2([1, 2, 3]), "ARRAY_SIZE:WRONG_NUM_ROWS");
      testCase.assertError(@() pwintz.math.atan2([1; 2; 3]), "ARRAY_SIZE:WRONG_NUM_ROWS");
    end % End of function.
  end % End of test methods

end
