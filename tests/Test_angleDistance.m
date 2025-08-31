classdef Test_angleDistance < matlab.unittest.TestCase
% ! You can run these tests to be run automically via angleDistance.test() by using the
% ! "runTestsStaticFunction" snippet to add a static method to angleDistance.m,
%or by running Test_angleDistance.runTests()

% methods (TestMethodSetup)
%	 function setup(testCase)
%		 % Setup code
%	 end
% end
%
% methods (TestMethodTeardown)
%	 function teardown(testCase)
%		 % Teardown code
%	 end
% end

methods(Static)
  function runTests(varargin) % Define convenience functions for running tests.
    % ⋘──────── Build a list of test strings ────────⋙
    test_class_name =  "Test_angleDistance";
    if isempty(varargin) 
      % If no arguments given, run all of the tests.
      test_strings = test_class_name;
    else
      % If an argument is given, run construct a list of test functions to run.
      test_strings = cellfun(@(function_name) test_class_name + "/" + function_name, varargin);
    end

    % ⋘──────── Run tests ────────⋙
    results = runtests(test_strings);

    % ⋘──────── Print results ────────⋙
    fprintf(...
      "%d Passed, %d Failed, %d Incomplete.\n", ...
      sum([results.Passed]), sum([results.Failed]), sum([results.Incomplete])...
    );
  end % End of function

end % End static methods block
  % ╭───────────────────────────────────╮
  % │ ╭───────────────────────────────╮ │
  % │ │             Tests             │ │
  % │ ╰───────────────────────────────╯ │
  % ╰───────────────────────────────────╯
  methods (Test)
    
    function Test_angleDistance_bothPositiveNearZero(testCase)
      testCase.assertEqual(pwintz.math.angleDistance(0, 0), 0);
      testCase.assertEqual(pwintz.math.angleDistance(0, 0.1), 0.1);
      testCase.assertEqual(pwintz.math.angleDistance(0.1, 0), 0.1);
      testCase.assertEqual(pwintz.math.angleDistance(0.5, 0.2), 0.3);
    end % End of function.
    
    
    function Test_angleDistance_eitherNegativeNearZero(testCase)
      testCase.assertEqual(pwintz.math.angleDistance(0, -0.1), 0.1, "AbsTol", 1e-6);
      testCase.assertEqual(pwintz.math.angleDistance(-0.1, 0), 0.1, "AbsTol", 1e-6);
      testCase.assertEqual(pwintz.math.angleDistance(0.1, -0.2), 0.3, "AbsTol", 1e-6);
    end % End of function.
    
    function Test_angleDistance_nearPi(testCase)
      testCase.assertEqual(pwintz.math.angleDistance(pi, pi), 0.0, "AbsTol", 1e-6);
      testCase.assertEqual(pwintz.math.angleDistance(pi-0.1, pi), 0.1, "AbsTol", 1e-6);
      testCase.assertEqual(pwintz.math.angleDistance(pi+0.1, pi-0.2), 0.3, "AbsTol", 1e-6);
    end % End of function.
    
    function Test_angleDistance_farFromEachOther(testCase)
      testCase.assertEqual(pwintz.math.angleDistance(0, pi), pi, "AbsTol", 1e-6);
      testCase.assertEqual(pwintz.math.angleDistance(0, 2*pi), 0, "AbsTol", 1e-6);
      testCase.assertEqual(pwintz.math.angleDistance(-12*pi, pi), pi, "AbsTol", 1e-6);
    end % End of function.
    
    
    function Test_angleDistance_multiple(testCase)
      testCase.assertEqual(pwintz.math.angleDistance([0; 0; 2*pi], [0; pi; 0.1]), [0; pi; 0.1], "AbsTol", 1e-6);
      testCase.assertEqual(pwintz.math.angleDistance([0, 0, 2*pi], [0, pi, 0.1]), [0, pi, 0.1], "AbsTol", 1e-6);
      % testCase.assertEqual(pwintz.math.angleDistance(0, 2*pi), 0, "AbsTol", 1e-6);
      % testCase.assertEqual(pwintz.math.angleDistance(-12*pi, pi), pi, "AbsTol", 1e-6);
    end % End of function.
  end % End of test methods

end
