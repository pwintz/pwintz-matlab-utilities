function even = isEven(integer)
    if(integer < 0)
        error("only positive values are supported.")
    end
   
    even = mod(integer, 2) == 0;
end
