% Takes a given Bell inequality BI in the 5-dimsional space (c.f. Eq. 20 in 2406.11792)
% 
% and returns it in the full dimensional space (c.f. Eq. 11)
%
% The inputed 5-dim BI is expressed with Bell coefficients associated to
% [P0|0<->P0|1<->P1|0<->P1|1, P00|00<->P00|11<->P11|00<->P11|11, P01|01<->P10|01, P00|01<->P11|01, P01|00<->P01|11, classical_bound]
% e.g. the 3PIBI #1 from Table II in 2406.11792 is inputed as
% BI = [1, 1, 0, -2, 0, 0]
%
% The returned full-dim BI is expressed with Bell coefficients associated to
% [P0|0, P1|0, P0|1, P1|1, P00|00, P01|00, P11|00, P00|01, P01|01, P10|01, P11|01, P00|11, P01|11, P11|11, classical_bound]
% 
% 
%
function res=from_5dim_to_FullDim(BI) 
    res=[BI(1,1),BI(1,1),BI(1,1),BI(1,1),BI(1,2),BI(1,5),BI(1,2),BI(1,4),BI(1,3),BI(1,3),BI(1,4),BI(1,2),BI(1,5),BI(1,2),BI(1,6)];
    % vector ordered with the Bell coefficients associated to:
    % [P0|0, P1|0, P0|1, P1|1, P00|00, P01|00, P11|00, P00|01, P01|01, P10|01, P11|01, P00|11, P01|11, P11|11, classical_bound]
end
    