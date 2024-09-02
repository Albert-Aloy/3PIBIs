% construct the local deterministic strategies 
% (to find the vertices of the local polytope)
% for 3-outcome 2-input permutationaly invariant Bell inequalities with n parties
% and further symmetrizing the inputs and outputs 
% see Table II and Eqs. 14-20 from https://arxiv.org/pdf/2406.11792

function V=build_lds_table_5dimensional(n) 

current_table=[];
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
                                            P00 = c00+c01+c02;
                                            P01 = c00+c10+c20;                                        
                                            P10 = c10+c11+c12;
                                            P11 = c01+c11+c21;
                                           
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
                                            
                                            current_table = [current_table; ...
                                                [1, P00+P01+P10+P11, P0000+P0011+P1100+P1111, P0101+P1001, P0001+P1101, P0100+P0111]];
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
    
V = struct('V',current_table);

end