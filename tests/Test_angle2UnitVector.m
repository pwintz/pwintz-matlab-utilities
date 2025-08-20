classdef Test_angle2UnitVector < matlab.unittest.TestCase
% ! You can run these tests to be run automically via angle2UnitVector.test() by using the
% ! "runTestsStaticFunction" snippet to add a static method to angle2UnitVector.m,
%or by running Test_angle2UnitVector.runTests()

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
    test_class_nam =  "Test_angle2UnitVector";
    if isempty(varargin) 
      % If no arguments given, run all of the tests.
      test_strings = test_class_name;
    else
      % If an argument is given, run construct a list of test functions to run.
      test_strings = cellfun(@(function_name) test_class_nam + "/" + function_name, varargin);
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
    
    function test_angle2UnitVector_single(testCase)
      testCase.assertEqual(pwintz.math.angle2UnitVector(0), [1; 0]);
    end % End of function.
    
    function test_angle2UnitVector_multiple(testCase)
      testCase.assertEqual(...
          pwintz.math.angle2UnitVector([0, pi/2, pi]), ...
          [[1; 0], [0; 1], [-1; 0]], ...
          "AbsTol", 1e-12 ...
      );
    end % End of function.
    
    % ╭─────────────────────────────────────────╮
    % │             Empty Arguments             │
    % ╰─────────────────────────────────────────╯
    function test_angle2UnitVector_empty(testCase)
      testCase.assertEqual(pwintz.math.angle2UnitVector([]), double.empty(0, 0));
    end % End of function.
    
    % ╭────────────────────────────────╮
    % │             Errors             │
    % ╰────────────────────────────────╯
    function test_angle2UnitVector_errorForTwoRowArgument(testCase)
      testCase.assertError(@() pwintz.math.angle2UnitVector([1, 2; 2, 3]), "ARRAY_SIZE:WRONG_NUM_ROWS");
    end % End of function.
  end % End of test methods

end
