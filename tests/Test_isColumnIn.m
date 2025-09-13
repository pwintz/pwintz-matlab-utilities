classdef Test_isColumnIn < matlab.unittest.TestCase
% runtests Test_isColumnIn

  methods (Test)

    function test_inEmptyArray(testCase)
      [is_a_column_in_array, linear_indices] = pwintz.arrays.isColumnIn([1; 2], double.empty(2, 0));
      testCase.assertFalse(is_a_column_in_array);
      testCase.assertEmpty(linear_indices);
    end % End of function.

    function test_columnVectorInColumnVector(testCase)
      col = [1; 2; 3; 4];
      [is_a_column_in_array, linear_indices] = pwintz.arrays.isColumnIn(col, col);
      testCase.assertTrue(is_a_column_in_array);
      testCase.assertEqual(linear_indices, 1);
    end % End of function.


    function test_column_not_found(testCase)
      col = [1; 2];
      array = [3, 3; 4, 5]
      [is_a_column_in_array, linear_indices] = pwintz.arrays.isColumnIn(col, array);
      testCase.assertFalse(is_a_column_in_array);
      testCase.assertEmpty(linear_indices);
    end % End of function.
    
  end % End of test methods

end % End of test methods block
