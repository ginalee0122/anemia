% BME 260 Spring 2017
% Modeling Blood Flow in Healthy and Anemic Physiology
% Heart: Consume O2 and glucose, establish flow rate through body.
% INPUTS:
%   b: Master struct with blood parameters out of heart.
% OUTPUTS:
%   bHeart: Blood parameters out of heart (post-metabolism).
%   fH    : Flow in/out.

function [bHeart] = heart(b)

    bHeart = respir(b);
    
    if b.i == 10
        baseO2 = b.concO2; % Set baseline O2 at steady state.
    end
    
    if b.i > 20
        bHeart.oxNeed = (b.concO2 - baseO2) .* 1; % Compute oxygen need
        if bHeart.oxNeed > 100
            bHeart.oxNeed = 100; % Max oxygen need is 100
        end
    end

    % Max cardiac output will be 15 L/min, very severe anemia.
    oxNeed = b.oxNeed; % Number from 0 (SS) to 100 (severe anemia).
    
    bHeart.cOut = (15000 - 5000)./100 .* oxNeed + 5000; % mL/min
end