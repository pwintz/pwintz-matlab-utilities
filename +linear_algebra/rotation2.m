function rotation_mat = rotation2(theta)
  % rotation2 Generate a 2D rotation matrix. 

  rotation_mat = [
    cos(theta), -sin(theta);
    sin(theta),  cos(theta);
  ];
end