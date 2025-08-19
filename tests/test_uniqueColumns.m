% ╭───────────────────────── ────────────────────────────╮
% │ ╭─────────────────────── ──────────────────────────╮ │
% │ │              Tests for uniqueColumns             │ │
% │ ╰─────────────────────── ──────────────────────────╯ │
% ╰───────────────────────── ────────────────────────────╯
% Run all of the local functions as test cases.
run(functiontests(localfunctions));

% ╭───────────────────────────────────╮
% │ ╭───────────────────────────────╮ │
% │ │             Tests             │ │
% │ ╰───────────────────────────────╯ │
% ╰───────────────────────────────────╯

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