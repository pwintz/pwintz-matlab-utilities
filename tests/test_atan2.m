% ╭──────────────────────────────────────────────╮
% │ ╭──────────────────────────────────────────╮ │
% │ │              Tests for atan2             │ │
% │ ╰──────────────────────────────────────────╯ │
% ╰──────────────────────────────────────────────╯
% Run all of the local functions as test cases.
run(functiontests(localfunctions));

% ╭───────────────────────────────────╮
% │ ╭───────────────────────────────╮ │
% │ │             Tests             │ │
% │ ╰───────────────────────────────╯ │
% ╰───────────────────────────────────╯

function test_atan2_fromVector_single(testCase)
  testCase.assertEqual(pwintz.math.atan2([1; 0]), 0);
end % End of function.

function test_atan2_fromVector_multiple(testCase)
  testCase.assertEqual(...
      pwintz.math.atan2([[1; 0], [0; 1], [-1; 0]]), ...
      [0, pi/2, pi], ...
      "AbsTol", 1e-12 ...
  );
end % End of function.

function test_atan2_fromComponents_single(testCase)
  testCase.assertEqual(...
      pwintz.math.atan2(0, 1), pi/2, "AbsTol", 1e-12 ...
  );
end % End of function.

% Check that the function behaves like the builtin atan2 function when there are two arguments given.
function test_atan2_fromComponents_multipleInRows(testCase)
  x = [0, 1, 0];
  y = [1, 0, -1];
  testCase.assertEqual(...
      pwintz.math.atan2(y, x), ...
      [0, pi/2, pi], ... % <- output is a row vector 
      "AbsTol", 1e-12 ...
  );
end % End of function.

function test_atan2_fromComponents_multipleInColumns(testCase)
  x = [0; 1; 0];
  y = [1; 0; -1];
  testCase.assertEqual(...
      pwintz.math.atan2(y, x), ...
      [0; pi/2; pi], ... % <- output is a column vector  
      "AbsTol", 1e-12 ...
  );
end % End of function.

function test_atan2_errorForTwoRowArgument(testCase)
  testCase.assertError(@() pwintz.math.atan2([1, 2, 3]), "ARRAY_SIZE:WRONG_NUM_ROWS");
  testCase.assertError(@() pwintz.math.atan2([1; 2; 3]), "ARRAY_SIZE:WRONG_NUM_ROWS");
end % End of function.