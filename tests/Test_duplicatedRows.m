classdef Test_duplicatedRows < matlab.unittest.TestCase
% runtests duplicatedRows
  methods (Test)
    % ╭───────────────────────────────────────╮
    % │             No duplicates             │
    % ╰───────────────────────────────────────╯
    function test_empty(testCase)
      % ⋘────────── Execute ─────────⋙
      [duplicated_rows, duplicated_row_ndxs, nonduplicated_rows, nonduplicated_row_ndxs] = pwintz.arrays.duplicatedRows([]);
      
      % ⋘────────── Verify ──────────⋙
      testCase.assertEmpty(duplicated_rows);
      testCase.assertEmpty(duplicated_row_ndxs);
      testCase.assertEmpty(nonduplicated_rows);
      testCase.assertEmpty(nonduplicated_row_ndxs);
    end % End of function.

    function test_oneRow_noDuplicates(testCase)
      % ⋘────────── Execute ─────────⋙
      [duplicated_rows, duplicated_row_ndxs, nonduplicated_rows, nonduplicated_row_ndxs] = pwintz.arrays.duplicatedRows([1, 1]);
      
      % ⋘────────── Verify ──────────⋙
      testCase.assertEmpty(duplicated_rows);
      testCase.assertEmpty(duplicated_row_ndxs);
      testCase.assertEqual(nonduplicated_rows, [1, 1]);
      testCase.assertEqual(nonduplicated_row_ndxs, 1);
      
    end % End of function.

    function test_twoRows_noDuplicates(testCase)
      % ⋘────────── Execute ─────────⋙
      [duplicated_rows, duplicated_row_ndxs, nonduplicated_rows, nonduplicated_row_ndxs] = pwintz.arrays.duplicatedRows([1, 1; 2, 2]);
      
      % ⋘────────── Verify ──────────⋙
      testCase.assertEmpty(duplicated_rows);
      testCase.assertEmpty(duplicated_row_ndxs);
      testCase.assertEqual(nonduplicated_rows, [1, 1; 2, 2]);
      testCase.assertEqual(nonduplicated_row_ndxs, [1; 2]);
    end % End of function.
    
    % ╭───────────────────────────────────────╮
    % │             Duplicate Row             │
    % ╰───────────────────────────────────────╯
    
    function test_twoRows_duplicates(testCase)
      % ⋘────────── Execute ─────────⋙
      [duplicated_rows, duplicated_row_ndxs, nonduplicated_rows, nonduplicated_row_ndxs] = pwintz.arrays.duplicatedRows([1, 4; 1, 4]);
      
      % ⋘────────── Verify ──────────⋙
      testCase.assertEqual(duplicated_rows, [1, 4]);
      testCase.assertEqual(duplicated_row_ndxs, [1; 2]);
      testCase.assertEmpty(nonduplicated_rows);
      testCase.assertEmpty(nonduplicated_row_ndxs);
    end % End of function.
    
    function test_multipleDifferentDuplicatedRows(testCase)
      % ⋘────────── Execute ─────────⋙
      array = [1, 4; 
               1, 4; 
               2, 3;
               0, 0; % <- Unique 
               1, 4; 
               2, 3;];
      [duplicated_rows, duplicated_row_ndxs, nonduplicated_rows, nonduplicated_row_ndxs] = pwintz.arrays.duplicatedRows(array);
      
      % ⋘────────── Verify ──────────⋙
      testCase.assertEqual(duplicated_rows,        [1, 4; 2, 3]);
      testCase.assertEqual(duplicated_row_ndxs,    [1; 2; 3; 5; 6]);
      testCase.assertEqual(nonduplicated_rows,     [0, 0]);
      testCase.assertEqual(nonduplicated_row_ndxs, 4);
    end % End of function.
    
  end % End of test methods

end % End of test methods block
