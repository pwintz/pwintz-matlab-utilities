function [times1, times2] = linspace_flow_times(jump_t, steps, trim_last)
    %%% jump_t: the time of the jump from the first interval of flow to the
    %%% second.
    %%% steps: the number of discretization steps in EACH interval.
    %%% trim_last: if true, then the last entry in each interval is
    %%% deleted. This is useful if the times correspond to control signals.

    global T
    if ~exist("trim_last", "var")
        trim_last = false;
    end
    
    times1 = linspace(0, jump_t, steps);
    times2 = linspace(jump_t, T, steps);
    
    if trim_last
        times1 = times1(1:end-1);
        times2 = times2(1:end-1);
    end
    
end