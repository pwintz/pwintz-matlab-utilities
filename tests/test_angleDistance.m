% ╭──────────────────────────────────────────────────────╮
% │ ╭──────────────────────────────────────────────────╮ │
% │ │              Tests for angleDistance             │ │
% │ ╰──────────────────────────────────────────────────╯ │
% ╰──────────────────────────────────────────────────────╯
% Run all of the local functions as test cases.
run(functiontests(localfunctions));

% ╭───────────────────────────────────╮
% │ ╭───────────────────────────────╮ │
% │ │             Tests             │ │
% │ ╰───────────────────────────────╯ │
% ╰───────────────────────────────────╯

function test_angleDistance_bothPositiveNearZero(testCase)
  testCase.assertEqual(pwintz.math.angleDistance(0, 0), 0);
  testCase.assertEqual(pwintz.math.angleDistance(0, 0.1), 0.1);
  testCase.assertEqual(pwintz.math.angleDistance(0.1, 0), 0.1);
  testCase.assertEqual(pwintz.math.angleDistance(0.5, 0.2), 0.3);
end % End of function.


function test_angleDistance_eitherNegativeNearZero(testCase)
  testCase.assertEqual(pwintz.math.angleDistance(0, -0.1), 0.1, "AbsTol", 1e-6);
  testCase.assertEqual(pwintz.math.angleDistance(-0.1, 0), 0.1, "AbsTol", 1e-6);
  testCase.assertEqual(pwintz.math.angleDistance(0.1, -0.2), 0.3, "AbsTol", 1e-6);
end % End of function.

function test_angleDistance_nearPi(testCase)
  testCase.assertEqual(pwintz.math.angleDistance(pi, pi), 0.0, "AbsTol", 1e-6);
  testCase.assertEqual(pwintz.math.angleDistance(pi-0.1, pi), 0.1, "AbsTol", 1e-6);
  testCase.assertEqual(pwintz.math.angleDistance(pi+0.1, pi-0.2), 0.3, "AbsTol", 1e-6);
end % End of function.

function test_angleDistance_farFromEachOther(testCase)
  testCase.assertEqual(pwintz.math.angleDistance(0, pi), pi, "AbsTol", 1e-6);
  testCase.assertEqual(pwintz.math.angleDistance(0, 2*pi), 0, "AbsTol", 1e-6);
  testCase.assertEqual(pwintz.math.angleDistance(-12*pi, pi), pi, "AbsTol", 1e-6);
end % End of function.


function test_angleDistance_multiple(testCase)
  testCase.assertEqual(pwintz.math.angleDistance([0; 0; 2*pi], [0; pi; 0.1]), [0; pi; 0.1], "AbsTol", 1e-6);
  testCase.assertEqual(pwintz.math.angleDistance([0, 0, 2*pi], [0, pi, 0.1]), [0, pi, 0.1], "AbsTol", 1e-6);
  % testCase.assertEqual(pwintz.math.angleDistance(0, 2*pi), 0, "AbsTol", 1e-6);
  % testCase.assertEqual(pwintz.math.angleDistance(-12*pi, pi), pi, "AbsTol", 1e-6);
end % End of function.