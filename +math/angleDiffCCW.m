function diff_array = angleDiffCCW(angle_array, options)
  % Compute the distance between angles in an array when measured in the clockwise direction.
  % Measurement is allowed to extend past 2*pi.
  % The output array is the same length as the input with the last entry equal to the distance from the last entry of the input to the first entry. The values of diff_array are always positive.
  arguments(Input)
    angle_array (1, :) double;
    options.index = [];
    options.indices = [];
  end % End of Input arguments block
  
  % Normalize to [0, 2*pi].
  angle_array = mod(angle_array, 2*pi); 

  % Pad the array using the first entry at the end.
  angle_array = [angle_array, angle_array(1)];

  % Compute difference
  diff_array = diff(angle_array);

  diff_array(diff_array < 0) = diff_array(diff_array < 0) + 2*pi;

  assert(all(diff_array >= 0))

  % ╭───────────────────────────────────────────────────╮
  % │             Handle Optional Arguments             │
  % ╰───────────────────────────────────────────────────╯
  % Select specific indices.
  assert(isempty(options.index) || isempty(options.indices), "The options ""index"" and ""indices"" cannot be used together.");
  if ~isempty(options.index)
    assert(isscalar(options.index));
    diff_array = diff_array(options.index);
  elseif ~isempty(options.indices)
    diff_array = diff_array(options.indices);
  end
end