% ╭──────────────────────────────────────────────╮
% │ ╭──────────────────────────────────────────╮ │
% │ │              Tests for range             │ │
% │ ╰──────────────────────────────────────────╯ │
% ╰──────────────────────────────────────────────╯
% Run all of the local functions as test cases.
run(functiontests(localfunctions));

% ╭───────────────────────────────────╮
% │ ╭───────────────────────────────╮ │
% │ │             Tests             │ │
% │ ╰───────────────────────────────╯ │
% ╰───────────────────────────────────╯

function test_range_testDescription(testCase)
  % ⋘────────── Setup ───────────⋙
  % pwintz.arrays.range(start=1, center=1, radius=1, diameter=1, step=1, count=1);
  pwintz.arrays.range(1, 1, n_values=2)
  % pwintz.arrays.range(1, step_size=0.1, n_values=2)
  
  % ⋘────────── Execute ─────────⋙
  
  
  % ⋘────────── Verify ──────────⋙
  % testCase.verifyFail("Test case needs to be implemented.");
end % End of function.