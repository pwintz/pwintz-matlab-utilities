function assertEqual(v1, v2)

    assert(all(size(v1) == size(v2)), "The sizes of v1 and v2 must match. size(v2)= %s and size(v2) = %s", mat2str(size(v1)), mat2str(size(v2)))
    assert(all(v1 == v2), 'The values %s and %s are not equal.', mat2str(v1), mat2str(v2))

end