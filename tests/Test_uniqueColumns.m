classdef Test_uniqueColumns < matlab.unittest.TestCase
% ` runtests Test_uniqueColumns

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
