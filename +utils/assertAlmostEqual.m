function assertAlmostEqual(v1, v2)

    diff = v1 - v2;
    error = vecnorm(diff);
    tol = 1e-3;
    assert(error <= tol, 'The error between %s and %s was %f > %f.', mat2str(v1), mat2str(v2), error, tol)

end