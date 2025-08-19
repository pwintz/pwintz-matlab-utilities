function dist = angleDistance(left, right)
  % Compute the distance between angles. That is, 0 and 2*pi are identified (treated as equal). 

  left  = mod( left, 2*pi); % Normalize to [0, 2*pi].
  right = mod(right, 2*pi); % Normalize to [0, 2*pi].
  dist = abs(left - right);

  % Two angles are never more than pi (180 degrees) from each other, so we update any such values in "dist" by subtracting them from 2*pi, effectively measureing the distance by wrapping around the circle in the opposite direction.
  dist(dist > pi) = 2*pi - dist(dist > pi);
end