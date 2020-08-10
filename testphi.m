success = 0

for i = 1:100
    target = phi_vol(55, i, 33);
    y = dyads_vol(55, i, 33, 2);
    x = dyads_vol(55, i, 33, 1);
    ratio = y/x;
    if abs(atan(ratio) - target) <= 0.05
        fprintf('\nClose! Off by %f', atan(ratio) - target)
        success = success + 1;
    elseif abs(atan(1/ratio) - target) <= 0.05 
        fprintf(The inverse was close')
    else 
        fprintf('\nTarget of %f not reached. Value is %f', target, atan(ratio))
    end
end
fprintf('\n%i successes', success)
