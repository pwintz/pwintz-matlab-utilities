classdef Test_findRowIn < matlab.unittest.TestCase
% ! You can run these tests to be run automically via _findRow.test() by using the
% ! "runTestsStaticFunction" snippet to add a static method to _findRow.m,
%or by running Test_findRowIn.runTests()

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
    test_class_name =  "Test_findRowIn";
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
  function test_arrayWithSingleRow_noMatch(testCase)
    expected_row_ndxs = double.empty(0, 1);
    testCase.assertEqual(pwintz.arrays.findRowIn([0, 5, 230], [1, 2, 3]), expected_row_ndxs);
  end % End of function.

    function test_arrayWithSingleRow_oneMatch(testCase)
      expected_row_ndxs = 1;
      testCase.assertEqual(pwintz.arrays.findRowIn([1, 2, 3], [1, 2, 3]), expected_row_ndxs);
    end % End of function.

    function test_arrayWithMultipleRow_noMatch(testCase)
      % ⋘────────── Setup ───────────⋙
      array = [
        1, 2, 3;
        3, 4, 5;
      ];
      
      % ⋘────────── Execute and Verify ──────────⋙
      expected_ndxs = double.empty(0, 1);
      testCase.assertEqual(pwintz.arrays.findRowIn([0, 0, 0], array), expected_ndxs);
    end % End of function.

    function test_arrayWithMultipleRow_oneMatch(testCase)
      % ⋘────────── Setup ───────────⋙
      array = [
        1, 2, 3;
        3, 4, 5;
      ];
      
      % ⋘────────── Execute and Verify ──────────⋙
      row_ndx = 2;
      testCase.assertEqual(pwintz.arrays.findRowIn(array(row_ndx,:), array), row_ndx);
    end % End of function.

    function test_arrayWithMultipleRow_multipleMatchs(testCase)
      % ⋘────────── Setup ───────────⋙
      array = [
        1, 2, 3; % These lines are equal.
        3, 4, 5;
        1, 2, 3; % These lines are equal.
      ];
      
      % ⋘────────── Execute and Verify ──────────⋙
      expected_row_ndxs = [1; 3];
      testCase.assertEqual(pwintz.arrays.findRowIn([1, 2, 3], array), expected_row_ndxs);
    end % End of function.

    function test_withTolerance(testCase)
      % ⋘────────── Setup ───────────⋙
      row_vec = [-1, 1.224646799e-16];
      array   = [-1, -8.362296309e-12; 
                 -1, -8.334169227e-12];
      
      % ⋘────────── Execute ─────────⋙
      row_ndxs = pwintz.arrays.findRowIn(row_vec, array, tolerance=1e-10);
      
      % ⋘────────── Verify ──────────⋙
      testCase.assertNotEmpty(row_ndxs);
    end % End of function.

  end % End of test methods

end
