% ╭─────────────────────────────────────────────────────────╮
% │ ╭─────────────────────────────────────────────────────╮ │
% │ │              Tests for angle2UnitVector             │ │
% │ ╰─────────────────────────────────────────────────────╯ │
% ╰─────────────────────────────────────────────────────────╯
% Run all of the local functions as test cases.
run(functiontests(localfunctions));

% ╭───────────────────────────────────╮
% │ ╭───────────────────────────────╮ │
% │ │             Tests             │ │
% │ ╰───────────────────────────────╯ │
% ╰───────────────────────────────────╯

function test_angle2UnitVector_single(testCase)
  testCase.assertEqual(pwintz.math.angle2UnitVector(0), [1; 0]);
end % End of function.

function test_angle2UnitVector_multiple(testCase)
  testCase.assertEqual(...
      pwintz.math.angle2UnitVector([0, pi/2, pi]), ...
      [[1; 0], [0; 1], [-1; 0]], ...
      "AbsTol", 1e-12 ...
  );
end % End of function.

% ╭─────────────────────────────────────────╮
% │             Empty Arguments             │
% ╰─────────────────────────────────────────╯
function test_angle2UnitVector_empty(testCase)
  testCase.assertEqual(pwintz.math.angle2UnitVector([]), double.empty(0, 0));
end % End of function.

% ╭────────────────────────────────╮
% │             Errors             │
% ╰────────────────────────────────╯
function test_angle2UnitVector_errorForTwoRowArgument(testCase)
  testCase.assertError(@() pwintz.math.angle2UnitVector([1, 2; 2, 3]), "ARRAY_SIZE:WRONG_NUM_ROWS");
end % End of function.