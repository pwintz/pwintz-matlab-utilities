function [array, info] = range(start_point, end_point, options)
  arguments(Input)
    start_point      double = [];
    end_point        double = [];
    options.start    double = [];
    options.end      double = [];
    options.center   double = [];

    % ⋘────────── Options for span ──────────⋙
    options.radius      double = [];
    options.diameter    double = [];
    options.step_size   double = [];
    options.n_steps     double = [];
    options.n_values    double = [];

    % ⋘────────── Options for inclusion of endpoints ──────────⋙
    options.includeStart (1, 1) logical = true;
    options.includeEnd (1, 1) logical = true;

    % ⋘──────── Behavior options ────────⋙
    % options.step_size_behavior = "stretch" | "shrink" | "rigid";
  end % End of Input arguments block
  
  arguments(Output)
    array (1, :) double;
    info         struct;
  end % End of Output arguments block

  % Two deterimine the location, must have at least one reference point among 
  % * start
  % * center
  % * end
  % To specify length, must specify one of the following
  % * [reference point] + [reference point]
  % * diameter
  % * radius
  % * step_size + n_steps (does not override other lengths)
  % * step_size + n_values (does not override other lengths)
  % To specify the number of steps and step size, we must have exactly one of the following:
  % * n_values
  % * n_steps
  % * [length] + step

  % Check that the start and end points are not given twice (i.e., as positional and name=value options).
  assert(isempty(start_point) || isempty(options.start));
  assert(isempty(end_point) || isempty(options.end));

  % Copy values of positional arguments into the options.
  if(isempty(options.start))
    options.start = start_point;
    clear start_point;
  end
  if(isempty(options.end))
    options.end = end_point;
    clear end_point;
  end

  has_start_option        = ~isempty(options.start);
  has_end_option          = ~isempty(options.end);
  has_center_option       = ~isempty(options.center);
  has_radius_option       = ~isempty(options.radius);
  has_diameter_option     = ~isempty(options.diameter);
  has_step_size_option    = ~isempty(options.step_size);
  has_n_values_option     = ~isempty(options.n_values);
  has_n_steps_option      = ~isempty(options.n_steps);

  % Check that we have the right number of reference point options.
  n_reference_point_options = has_start_option + has_end_option + has_center_option;
  assert(n_reference_point_options >= 1, "Must give at least one reference point");
  assert(n_reference_point_options < 3, "Cannot give three reference points.");
  
  % Check that we have the right number of length options.
  n_length_options = has_diameter_option ...
                      + has_radius_option ...
                      + (n_reference_point_options == 2);
  assert(n_length_options <= 1);


  
  % Check that we have the right number of step size / step count options.
  assert(n_length_options == 1 ... 
          || (has_step_size_option && has_n_values_option) ... 
          || (has_step_size_option && has_n_steps_option))

  assert(isempty(options.center), '"center" not implemented');
  assert(isempty(options.diameter), '"diameter" not implemented');
  assert(isempty(options.radius), '"diameter" not implemented');
  assert(isempty(options.step_size), '"step_size" not implemented');
  
  % ╭───────────────────────────────────────────────────────╮
  % │             Compute range using endpoints             │
  % ╰───────────────────────────────────────────────────────╯
  n_interior_points = options.n_values - options.includeStart - options.includeEnd;
  n_linspace_points = n_interior_points + 2;
  array = linspace(options.start, options.end, n_linspace_points);
  if ~options.includeStart
    array = array(2:end);
  end
  if ~options.includeEnd
    array = array(1:end - 1);
  end

  % ╭───────────────────────────────────────────────────────╮
  % │             Compute range using step size+start             │
  % ╰───────────────────────────────────────────────────────╯
  
  % ╭────────────────────────────────────────────────────╮
  % │             Compute range using center             │
  % ╰────────────────────────────────────────────────────╯
  

  % ⋘────────── If the info output arg is being used, then generate an info structure ──────────⋙
  if nargout() == 2
    info = struct("n_reference_point_options", n_reference_point_options, "n_length_options", n_length_options)
  end
end % end function