classdef Test_assertNoneEqual < matlab.unittest.TestCase
% ` runtests Test_assertNoneEqual
  methods (Test)
    function test_nonequal_OK(~)
      % ⋘────────── Execute ─────────⋙
      pwintz.assertions.assertNoneEqual([1, 2], 0);
    end % End of function.
    function test_one_equal_raises_error(testCase)
      % ⋘────────── Execute ─────────⋙
      errID = "pwintz:assertNoneEqual";
      testCase.assertError(@() pwintz.assertions.assertNoneEqual([1, 0], 0), errID);
    end % End of function.
    function test_one_equal_columns_raises_error(testCase)
      % ⋘────────── Execute ─────────⋙
      errID = "pwintz:assertNoneEqual";
      testCase.assertError(@() pwintz.assertions.assertNoneEqual([1;  0], 0), errID);
    end % End of function.
    function test_multiple_equal(testCase)
      % ⋘────────── Execute ─────────⋙
      errID = "pwintz:assertNoneEqual";
      testCase.assertError(@() pwintz.assertions.assertNoneEqual([1; 0;  0], 0), errID);
    end % End of function.
    function test_multiple_equal_mat(testCase)
      % ⋘────────── Execute ─────────⋙
      errID = "pwintz:assertNoneEqual";
      testCase.assertError(@() pwintz.assertions.assertNoneEqual([1, 1, 2; 0, 0, 1], 0), errID);
    end % End of function.
  end % End of test methods

end % End of test methods block
