function dy_dx = derivative(x, y)
    dy_dx = gradient(y)./gradient(x);
end