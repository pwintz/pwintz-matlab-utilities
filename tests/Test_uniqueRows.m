classdef Test_uniqueRows < matlab.unittest.TestCase
% ` runtests Test_uniqueRows

  methods (Test)
    function test_uniqueRows_allDistinct(testCase)
      % ⋘────────── Setup ───────────⋙
      A = [1, 1; 2, 2];
      
      % ⋘────────── Execute ─────────⋙
      result = pwintz.arrays.uniqueRows(A);
      
      % ⋘────────── Verify ──────────⋙
      testCase.assertEqual(result, A);
    end % End of function.


  function test_uniqueRows_repeatedRow(testCase)
    % ⋘────────── Setup ───────────⋙
    A = [1, 2; 1, 2];
    
    % ⋘────────── Execute ─────────⋙
    result = pwintz.arrays.uniqueRows(A);
    
    % ⋘────────── Verify ──────────⋙
    testCase.assertEqual(result, [1, 2]);
  end % End of function.

  function test_noTolerance_almostEqualRows(testCase)
    % ⋘────────── Setup ───────────⋙
    A = [1, 2; 
        1, 2 + 1e-8];
    
    % ⋘────────── Execute ─────────⋙
    result = pwintz.arrays.uniqueRows(A);
    
    % ⋘────────── Verify ──────────⋙
    testCase.assertEqual(result, A);
  end % End of function.

  function test_tolerance_almostEqualRows(testCase)
    % ⋘────────── Setup ───────────⋙
    A = [1, 2; 
         1, 2 + 1e-8];
    
    % ⋘────────── Execute ─────────⋙
    result = pwintz.arrays.uniqueRows(A, tolerance=1e-6);
    
    % ⋘────────── Verify ──────────⋙
    testCase.assertEqual(result, [1, 2]);
  end % End of function.
  end % End of test methods

end
