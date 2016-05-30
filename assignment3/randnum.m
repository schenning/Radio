function res = randnum()
    % Generates a random number drawn from a uniform dist in the
    % range -pi:pi
    res =  2*pi*rand(1,1,'double') -pi;
    if res == pi
        randnum();
    end
    
end

