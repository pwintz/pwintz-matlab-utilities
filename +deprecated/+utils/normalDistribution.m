function x = normalDistribution(mean, std)
  % Generate a random vector from a normal distribution. 
  % Input arguments:
  %   mean: A vector 
  %   std: a scalar or a vector of the same size as "mean". 
  % Output:
  %   x: A random vector of the same size as "mean" with each i-th component sampled from a Gaussian distribution with mean(i) and standard deviation std or std(i) (with the latter used if std is a vector). 
  assert(isscalar(std) || all(size(mean) == size(std)))
  x = mean + std.*randn(size(mean));
end