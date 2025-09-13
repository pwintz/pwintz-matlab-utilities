classdef Test_findColumnsIn < matlab.unittest.TestCase
  % `runtests Test_findColumnsIn

  % ╭───────────────────────────────────╮
  % │ ╭───────────────────────────────╮ │
  % │ │             Tests             │ │
  % │ ╰───────────────────────────────╯ │
  % ╰───────────────────────────────────╯
  methods (Test)
    function test_searchForColumnsInEmptyArray(testCase)
      array = double.empty(3, 0);
      search_columns = [1; 2; 3];
      % The expected indices is an empty row vector (1x0).
      expected_ndxs = {double.empty(0, 1)};
      testCase.assertEqual(pwintz.arrays.findColumnsIn(search_columns, array), expected_ndxs);
    end % End of function
    
    % ╭────────────────────────────────────────────────────╮
    % │             Test searching for one column             │
    % ╰────────────────────────────────────────────────────╯
    function test_arrayWithSingleColumn_noMatch(testCase)
      expected_column = {double.empty(0, 1)};
      testCase.assertEqual(pwintz.arrays.findColumnsIn([0; 5; 230], [1; 2; 3]), expected_column);
    end % End of function.

    function test_arrayWithSingleColumn_oneMatch(testCase)
      expected_column = {1};
      testCase.assertEqual(pwintz.arrays.findColumnsIn([1; 2; 3], [1; 2; 3]), expected_column);
    end % End of function.

    function test_arrayWithMultipleColumn_noMatch(testCase)
      % ⋘────────── Setup ───────────⋙
      array = [
        1, 2, 3;
        3, 4, 5;
      ];
      
      % ⋘────────── Execute and Verify ──────────⋙
      expected_ndxs = {double.empty(0, 1)};
      testCase.assertEqual(pwintz.arrays.findColumnsIn([0; 0], array), expected_ndxs);
    end % End of function.

    function test_arrayWithMultipleColumn_oneMatch(testCase)
      % ⋘────────── Setup ───────────⋙
      array = transpose([
        1, 2, 3;
        3, 4, 5;
      ]);
      
      % ⋘────────── Execute and Verify ──────────⋙
      result = pwintz.arrays.findColumnsIn([3; 4; 5], array);
      expected_column_ndxs = {2};
      testCase.assertEqual(result, expected_column_ndxs);
    end % End of function.

    function test_arrayWithMultipleColumn_multipleMatches(testCase)
      % ⋘────────── Setup ───────────⋙
      array = transpose([
        1, 2, 3; % These lines are equal.
        3, 4, 5;
        1, 2, 3; % These lines are equal.
      ]);
      
      % ⋘────────── Execute and Verify ──────────⋙
      expected_column_ndxs = {[1, 3]};
      testCase.assertEqual(pwintz.arrays.findColumnsIn([1; 2; 3], array), expected_column_ndxs);
    end % End of function.

    function test_withTolerance(testCase)
      % ⋘────────── Setup ───────────⋙
      column_vec = [-1; 1.224646799e-16];
      array   = transpose([-1, -8.362296309e-12; 
                           -1, -8.334169227e-12]);
      
      % ⋘────────── Execute ─────────⋙
      column_ndxs = pwintz.arrays.findColumnsIn(column_vec, array, tolerance=1e-10);
      
      % ⋘────────── Verify ──────────⋙
      expected_column_ndxs = {[1, 2]};
      testCase.assertEqual(column_ndxs, expected_column_ndxs);
    end % End of function.

    % ╭──────────────────────────────────────────────────────────╮
    % │           Test Searching for Multiple Columns            │
    % ╰──────────────────────────────────────────────────────────╯
    function test_searchForTwoColumns_oneMatch(testCase)
      array = [1; 2];
      search_columns = [[1; 2], [3; 4]];
      result = pwintz.arrays.findColumnsIn(search_columns, array);
      testCase.assertEqual(result{1}, 1);
      testCase.assertEmpty(result{2});
    end % End of function

    function test_searchTwoColumns_multipleMatches(testCase)
      array = [[1; 2], [0; 0], [1; 2], [0; 0], [0; 0]];
      search_columns = [[1; 2], [0; 0]];
      result = pwintz.arrays.findColumnsIn(search_columns, array);
      testCase.assertEqual(result{1}, [1, 3]);
      testCase.assertEqual(result{2}, [2, 4, 5]);
    end % End of function

  end % End of test methods

end
