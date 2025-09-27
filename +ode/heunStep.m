function x_plus = heunStep(f, step_size, t, x)
  % Computes a single step of Heun's numerical ODE method for \dot x = f(t, x). 
  % Inputs:
  % - f: A function handle with signature @(t, x) that returns the value of f(t, x). 
  % - step_size: A positive scalar.
  % - t: The time at the start of the step (scalar).
  % - x: The state at the start of the set (vector). 

  assert(isscalar(step_size))
  assert(isscalar(t))

  h = step_size;
  k1 = f(    t,          x);
  k2 = f(t + h, x + h * k1);
  x_plus = x + (h/2) * (k1 + k2);
end