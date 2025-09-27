function x_plus = rk4step(f, step_size, t, x)
  % Computes a single step of Runge-Kutta 4 an ODE \dot x = f(t, x). 
  % Inputs:
  % - f: A function handle with signature @(t, x) that returns the value of f(t, x). 
  % - step_size: A positive scalar.
  % - t: The time at the start of the step (scalar).
  % - x: The state at the start of the set (vector). 

  assert(isscalar(step_size))
  assert(isscalar(t))
  
  h = step_size;
  k1 = f(t,         x);
  k2 = f(t + (h/2), x + (h/2)*k1);
  k3 = f(t + (h/2), x + (h/2)*k2);
  k4 = f(t + h  , x   +     h*k3);

  x_plus = x + (h/6) * (k1 + 2*k2 + 2*k3 + k4);

end