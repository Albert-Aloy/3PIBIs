%% Given a Bell inequality BI, find its classical bound for n parties
% BI must be inputed with the alphas associated to:
% [P00, P10, P01, P11, P00|00, P01|00, P11|00, P00|01, P01|01, P10|01, P11|01, P00|11, P01|11, P11|11, beta_c]

function res=find_classical_bound(n,BI)
current_table = [];
for c00=0:1:n
        for c01 = 0:1:n-c00
            for c02 = 0:1:n-c00-c01
                for c10=0:1:n-c00-c01-c02
                    for c11 = 0:1:n-c00-c01-c02-c10
                        for c12 = 0:1:n-c00-c01-c02-c10-c11
                            for c20=0:1:n-c00-c01-c02-c10-c11-c12
                                for c21 = 0:1:n-c00-c01-c02-c10-c11-c12-c20
                                    for c22 = 0:1:n-c00-c01-c02-c10-c11-c12-c20-c21
                                        if c00+c01+c02+c10+c11+c12+c20+c21+c22==n
                                            P00=c00+c01+c02;
                                            P10=c10+c11+c12;
                                            P01=c00+c10+c20;
                                            P11=c01+c11+c21;
                                           
                                            P0000 = P00^2-P00; 
                                            P0100 = P00*P10;
                                            P1000 = P00*P10; % P0100 = P1000 
                                            P1100 = P10^2-P10;
                                            P0001 = P00*P01-c00; 
                                            P0101 = P00*P11-c01; 
                                            P1001 = P10*P01-c10; 
                                            P1101 = P10*P11-c11; 
                                            P0010 = P00*P01-c00; % P0001 = P0010
                                            P0110 = P01*P10-c10; % P1001 = P0110
                                            P1010 = P11*P00-c01; % P0101 = P0110
                                            P1110 = P11*P10-c11; % P1101 = P1110
                                            P0011 = P01^2-P01;
                                            P0111 = P01*P11; % P0011 = P0111
                                            P1011 = P11*P01;
                                            P1111 = P11^2-P11;
                                                       
                                            tmp = BI(1)*(P00)+BI(2)*(P10)+BI(3)*(P01)+BI(4)*(P11)+BI(5)*(P0000)+BI(6)*(P0100)+BI(7)*(P1100)+BI(8)*(P0001)+BI(9)*P0101+BI(10)*P1001+BI(11)*(P1101)+BI(12)*P0011+BI(13)*(P0111)+BI(14)*(P1111);                                        
                                            current_table = [current_table;tmp];
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
end

% after having tested all the local deterministic strategies with the given BI, return the minimal value
res=min(current_table);

end