classdef Test_filterRows < matlab.unittest.TestCase
% runtests Test_filterRows
  methods (Test)
    function test_oneMatch_oneNotMatched(testCase)
      % ⋘────────── Setup ───────────⋙
      array = [1, 1, 1; 0, 0, 0];
      filter_fun = @(x) norm(x) > 1;
    
      % ⋘────────── Execute ─────────⋙
      matched_rows = pwintz.arrays.filterRows(filter_fun, array);
      
      % ⋘────────── Verify ──────────⋙
      testCase.assertEqual(matched_rows, [1, 1, 1]);
    end % End of function.
    
    function test_noMatches(testCase)
      % ⋘────────── Setup ───────────⋙
      array = [1, 1, 1; 0, 0, 0];
      filter_fun = @(x) false;
    
      % ⋘────────── Execute ─────────⋙
      matched_rows = pwintz.arrays.filterRows(filter_fun, array);
      
      % ⋘────────── Verify ──────────⋙
      testCase.assertEqual(matched_rows, double.empty(0, 3));
    end % End of function.

    % ╭─────────────────────────────────────╮
    % │             Cell arrays             │
    % ╰─────────────────────────────────────╯
    function test_cell_one_match(testCase)
      % ⋘────────── Setup ───────────⋙
      array = {1, 1, 1; 0, 0, 0};
      filter_fun = @(x) x{1} == 0;
    
      % ⋘────────── Execute ─────────⋙
      matched_rows = pwintz.arrays.filterRows(filter_fun, array);
      
      % ⋘────────── Verify ──────────⋙
      testCase.assertEqual(matched_rows, {0, 0, 0});
    end % End of function.
  end % End of test methods

end % End of test methods block
