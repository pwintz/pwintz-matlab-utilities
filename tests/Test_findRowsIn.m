classdef Test_findRowsIn < matlab.unittest.TestCase

  % ╭───────────────────────────────────╮
  % │ ╭───────────────────────────────╮ │
  % │ │             Tests             │ │
  % │ ╰───────────────────────────────╯ │
  % ╰───────────────────────────────────╯
  methods (Test)
    function test_searchForRowsInEmptyArray(testCase)
      array = double.empty(0, 3);
      search_rows = [1, 2, 3];
      expected_row = {double.empty(1, 0)};
      testCase.assertEqual(pwintz.arrays.findRowsIn(search_rows, array), expected_row);
    end % End of function
    
    % ╭────────────────────────────────────────────────────╮
    % │             Test searching for one row             │
    % ╰────────────────────────────────────────────────────╯
    function test_arrayWithSingleRow_noMatch(testCase)
      expected_row = {double.empty(1, 0)};
      testCase.assertEqual(pwintz.arrays.findRowsIn([0, 5, 230], [1, 2, 3]), expected_row);
    end % End of function.

    function test_arrayWithSingleRow_oneMatch(testCase)
      expected_row = {1};
      testCase.assertEqual(pwintz.arrays.findRowsIn([1, 2, 3], [1, 2, 3]), expected_row);
    end % End of function.

    function test_arrayWithMultipleRow_noMatch(testCase)
      % ⋘────────── Setup ───────────⋙
      array = [
        1, 2, 3;
        3, 4, 5;
      ];
      
      % ⋘────────── Execute and Verify ──────────⋙
      expected_ndxs = {double.empty(1, 0)};
      testCase.assertEqual(pwintz.arrays.findRowsIn([0, 0, 0], array), expected_ndxs);
    end % End of function.

    function test_arrayWithMultipleRow_oneMatch(testCase)
      % ⋘────────── Setup ───────────⋙
      array = [
        1, 2, 3;
        3, 4, 5;
      ];
      
      % ⋘────────── Execute and Verify ──────────⋙
      result = pwintz.arrays.findRowsIn([3, 4, 5], array);
      expected_row_ndxs = {2};
      testCase.assertEqual(result, expected_row_ndxs);
    end % End of function.

    function test_arrayWithMultipleRow_multipleMatchs(testCase)
      % ⋘────────── Setup ───────────⋙
      array = [
        1, 2, 3; % These lines are equal.
        3, 4, 5;
        1, 2, 3; % These lines are equal.
      ];
      
      % ⋘────────── Execute and Verify ──────────⋙
      expected_row_ndxs = {[1; 3]};
      testCase.assertEqual(pwintz.arrays.findRowsIn([1, 2, 3], array), expected_row_ndxs);
    end % End of function.

    function test_withTolerance(testCase)
      % ⋘────────── Setup ───────────⋙
      row_vec = [-1, 1.224646799e-16];
      array   = [-1, -8.362296309e-12; 
                 -1, -8.334169227e-12];
      
      % ⋘────────── Execute ─────────⋙
      row_ndxs = pwintz.arrays.findRowsIn(row_vec, array, tolerance=1e-10);
      
      % ⋘────────── Verify ──────────⋙
      expected_row_ndxs = {[1; 2]};
      testCase.assertEqual(row_ndxs, expected_row_ndxs);
    end % End of function.

    % ╭──────────────────────────────────────────────────────────╮
    % │             Test Searching for Multiple Rows             │
    % ╰──────────────────────────────────────────────────────────╯
    function test_searchTwoRows_oneMatch(testCase)
      array = [1, 2];
      search_rows = [1, 2; 3, 4];
      result = pwintz.arrays.findRowsIn(search_rows, array);
      testCase.assertEqual(result{1}, 1);
      testCase.assertEmpty(result{2});
    end % End of function

    function test_searchTwoRows_multipleMatches(testCase)
      array = [1, 2; 0, 0; 1, 2; 0, 0; 0, 0];
      search_rows = [1, 2; 0, 0];
      result = pwintz.arrays.findRowsIn(search_rows, array);
      testCase.assertEqual(result{1}, [1; 3]);
      testCase.assertEqual(result{2}, [2; 4; 5]);
    end % End of function

  end % End of test methods

end
