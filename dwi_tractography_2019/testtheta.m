success = 0
for i = 1:100
    target = theta_vol(i, 64, 30);
    y = dyads_vol(i, 64, 30, 2);
    x = dyads_vol(i, 64, 30, 1);
    z = dyads_vol(i, 64, 30, 3);
    ratio = z / ((x^2 + y^2) ^ 0.5);
    if abs((0.5*pi - atan(ratio)) - target) <= 0.05
        fprintf('\nClose! %f Off %f by %f',(0.5*pi - atan(ratio)),target, (0.5*pi - atan(ratio) - target))
        success = success + 1;
    else 
        fprintf('\nTarget of %f not reached. Value is %f', target, (0.5*pi - atan(ratio)) - target)
    end
end
fprintf('\n%i successes', success)
