classdef Test_uniqueColumns < matlab.unittest.TestCase
% ! You can run these tests to be run automically via _uniqueColumns.test() by using the
% ! "runTestsStaticFunction" snippet to add a static method to _uniqueColumns.m,
% ! or by running Test_uniqueColumns.runTests()

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
    test_class_nam =  "Test_uniqueColumns";
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
    function test_uniqueColumns_allDistinct(testCase)
      % ⋘────────── Setup ───────────⋙
      A = [[1; 1], [2; 2]];
      
      % ⋘────────── Execute ─────────⋙
      result = pwintz.arrays.uniqueColumns(A);
      
      % ⋘────────── Verify ──────────⋙
      testCase.assertEqual(result, A);
    end % End of function.


    function test_uniqueColumns_repeatedColumn(testCase)
      % ⋘────────── Setup ───────────⋙
      A = [[1; 2], [1; 2]];
      
      % ⋘────────── Execute ─────────⋙
      result = pwintz.arrays.uniqueColumns(A);
      
      % ⋘────────── Verify ──────────⋙
      testCase.assertEqual(result, [1; 2]);
    end % End of function.
  end % End of test methods

end
