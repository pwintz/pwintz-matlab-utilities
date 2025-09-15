function assertAlmostEqual(v1, v2)

    diff = v1 - v2;
    error_val = abs(diff);
    tol = 1e-6;
    if any(error_val > tol)
        % inequal_ndxs = find(error > tol);
        msg = pwintz.strings.format('The error between %g and %g was %g > %g.', v1, v2, error_val, tol);
        exception = MException("PWINTZ:assertAlmostEqual", msg);
        throw(exception);
    end

end