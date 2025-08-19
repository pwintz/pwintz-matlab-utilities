function vectors = angle2UnitVector(angles)
  if isempty(angles)
    vectors = double.empty(0, size(angles, 2));
    return
  end

  pwintz.assertions.assertNumRows(angles, 1);
  assert(size(angles, 1) == 1, "angles must have %d rows, but instead had %d.", 1, size(angles, 1));

  vectors = [cos(angles); 
             sin(angles)];
  % vectors  = nan([dimension, n_slices]);
  % for i = 1:n_slices
  %   vectors(:,i) = [cos(angles(i)); sin(angles(i))];
  % end
end