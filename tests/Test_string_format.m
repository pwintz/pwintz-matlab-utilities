classdef Test_string_format < matlab.unittest.TestCase
% runtests test_string_format
  methods (Test)
    function ignore(testCase)
      testCase.assumeFail();
      % ⋘────────── Setup ───────────⋙
      fmt = "%s, %d, %f, %s, %s, %8.2g, %.3f";
      args = {["hello", "world"], [1, 2, 3, 4], magic(4), cell(2, 3), magic(2), 1.240e8, [1, 2, 3.45; 2, 4, -1]};

      % % ⋘────────── Execute ─────────⋙
      % str = pwintz.strings.format(fmt, args{:})
      % 
      % % ⋘────────── Verify ──────────⋙
      % testCase.verifyFail("Test case needs to be implemented.");
    end % End of function.
    
    function test_1arg_string(testCase)
      % ⋘────────── Setup ───────────⋙
      fmt = "%s";
      args = {"hello"};
    
      % ⋘────────── Execute ─────────⋙
      str = pwintz.strings.format(fmt, args{:});
      
      % ⋘────────── Verify ──────────⋙
      testCase.assertEqual(str, "hello");
      
    end % End of function.

    function test_1arg_string_minWidth(testCase)
      % ⋘────────── Setup ───────────⋙
      fmt = "%6s";
      args = {"hello"};
    
      % ⋘────────── Execute ─────────⋙
      str = pwintz.strings.format(fmt, args{:});
      
      % ⋘────────── Verify ──────────⋙
      testCase.assertEqual(str, " hello");
      
    end % End of function.
    
    function test_1arg_string_array(testCase)
      % ⋘────────── Setup ───────────⋙
      fmt = "%s";
      args = {["hello", "world"]};
    
      % ⋘────────── Execute ─────────⋙
      str = pwintz.strings.format(fmt, args{:});
      
      % ⋘────────── Verify ──────────⋙
      testCase.assertEqual(str, "[hello, world]");
      
    end % End of function.
    
    function test_1arg_string_cell(testCase)
      % ⋘────────── Setup ───────────⋙
      fmt = "%s";
      args = {{"hello", "world"}};
    
      % ⋘────────── Execute ─────────⋙
      str = pwintz.strings.format(fmt, args{:});
      
      % ⋘────────── Verify ──────────⋙
      testCase.assertEqual(str, "{hello, world}");
      
    end % End of function.

    function test_1arg_cell_of_arrays(testCase)
      % ⋘────────── Setup ───────────⋙
      fmt = "%s";
      args = {{{1}, {2, 3}, {}, [2; 3]}};
    
      % ⋘────────── Execute ─────────⋙
      str = pwintz.strings.format(fmt, args{:});
      
      % ⋘────────── Verify ──────────⋙
      testCase.assertEqual(str, "{1x1 cell, 1x2 cell, 0x0 cell, 2x1 double}");
      
    end % End of function.

  function test_size_of_array(testCase)
    % ⋘────────── Setup ───────────⋙
    fmt = "%z";
    args = {[1, 2];};

    % ⋘────────── Execute ─────────⋙
    str = pwintz.strings.format(fmt, args{:});
    
    % ⋘────────── Verify ──────────⋙
    testCase.assertEqual(str, "1x2");
    
  end % End of function.

  function test_size_of_array_mxnxp(testCase)
    % ⋘────────── Setup ───────────⋙
    fmt = "%z";
    array = [1, 2; 3, 4; 5, 6];

    % Add a second "page"
    array(:, :, 2) = array;

    % ⋘────────── Execute ─────────⋙
    str = pwintz.strings.format(fmt, array);
    
    % ⋘────────── Verify ──────────⋙
    testCase.assertEqual(str, "3x2x2");
    
  end % End of function.

  function test_size_of_cell(testCase)
    % ⋘────────── Setup ───────────⋙
    fmt = "%z";
    args = {{1, 2, 3; 4, 5, 6}};

    % ⋘────────── Execute ─────────⋙
    str = pwintz.strings.format(fmt, args{:});
    
    % ⋘────────── Verify ──────────⋙
    testCase.assertEqual(str, "2x3");
    
  end % End of function.

  end % End of test methods

end % End of test methods block
