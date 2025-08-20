classdef Test_range < matlab.unittest.TestCase
% ! You can run these tests to be run automically via range.test() by using the
% ! "runTestsStaticFunction" snippet to add a static method to range.m,
%or by running Test_range.runTests()

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
    test_class_nam =  "Test_range";
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
    function Test_range_testDescription(testCase)
      % ⋘────────── Setup ───────────⋙
      % pwintz.arrays.range(start=1, center=1, radius=1, diameter=1, step=1, count=1);
      pwintz.arrays.range(1, 1, n_values=2);
      % pwintz.arrays.range(1, step_size=0.1, n_values=2)
      
      % ⋘────────── Execute ─────────⋙
      
      
      % ⋘────────── Verify ──────────⋙
      testCase.verifyFail("Test case needs to be implemented.");
    end % End of function.
  end % End of test methods

end
