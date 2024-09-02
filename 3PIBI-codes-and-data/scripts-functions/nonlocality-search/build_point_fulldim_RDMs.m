% Builds the probability distribution for n parties, 3 outcomes, given
% all two-body reduced density matrices RDMs and the measurement projectors proj1 proj2
function res = build_point_fulldim_RDMs(n,RDMs,proj1,proj2)

% proj are arrays containing the following
P0_A0=proj1{1}; % where P0_A0 is the probability of obtaining outcome 0 having set measurement A0
P1_A0=proj1{2};
%P2_A0=proj1{3};

P0_A1=proj2{1};
P1_A1=proj2{2};
%P2_A1=proj2{3};

P00=0;P01=0;P10=0;P11=0;P0000=0;P0100=0;P1100=0;P0101=0;P0110=0;P0001=0;P1101=0;P0011=0;P0111=0;P1111=0;

% 1-body
    for i=1:n
       P00=P00+trace(RDMs{i,i}*P0_A0);
       P01=P01+trace(RDMs{i,i}*P0_A1);
       P10=P10+trace(RDMs{i,i}*P1_A0);
       P11=P11+trace(RDMs{i,i}*P1_A1);
    end
    
% 2-body
    for i=1:n         
        for j=1:n   
            if j==i         
            else    
                P0000=P0000+trace(RDMs{i,j}*kron(P0_A0,P0_A0));
                P0100=P0100+trace(RDMs{i,j}*kron(P0_A0,P1_A0));
                P1100=P1100+trace(RDMs{i,j}*kron(P1_A0,P1_A0));
                P0101=P0101+trace(RDMs{i,j}*kron(P0_A0,P1_A1));
                P0110=P0110+trace(RDMs{i,j}*kron(P0_A1,P1_A0));
                P0001=P0001+trace(RDMs{i,j}*kron(P0_A0,P0_A1));
                P1101=P1101+trace(RDMs{i,j}*kron(P1_A0,P1_A1));
                P0011=P0011+trace(RDMs{i,j}*kron(P0_A1,P0_A1));
                P0111=P0111+trace(RDMs{i,j}*kron(P0_A1,P1_A1));
                P1111=P1111+trace(RDMs{i,j}*kron(P1_A1,P1_A1));  
            end
        end
    end
    p = [1, P00, P01, P10, P11, P0000, P0100, P1100, P0101, P0110, P0001, P1101, P0011, P0111, P1111];

res=p;

end
