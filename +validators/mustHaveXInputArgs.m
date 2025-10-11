function  mustHaveXInputArgs(f_handle, x)
    assert(nargin(f_handle) == x, "The function must take %d arguments. Instead it had %d.", x, nargin(f_handle));
end