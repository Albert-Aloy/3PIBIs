%Builds probability distribution for n parties, 3 outcomes, given
%the two-body RDM rho2 and the measurement projectors proj1 proj2
function res = build_point_fulldim(n,rho2,proj1,proj2)

% proj are arrays containing the following
P0_A0=proj1{1}; % where P0_A0 is the probability of obtaining outcome 0 having set measurement A0
P1_A0=proj1{2};
%P2_A0=proj1{3};

P0_A1=proj2{1};
P1_A1=proj2{2};
%P2_A1=proj2{3};

P00 = n*trace(rho2*kron(P0_A0,eye(3)));
P10 = n*trace(rho2*kron(P1_A0,eye(3)));
%P20 = n*trace(rho2*kron(P2_A0,eye(3)));
P01 = n*trace(rho2*kron(P0_A1,eye(3)));
P11 = n*trace(rho2*kron(P1_A1,eye(3)));
%P21 = n*trace(rho2*kron(P2_A1,eye(3)));
P0000 = n*(n-1)*trace(rho2*kron(P0_A0,P0_A0));
P0100 = n*(n-1)*trace(rho2*kron(P0_A0,P1_A0));
P1100 = n*(n-1)*trace(rho2*kron(P1_A0,P1_A0));

P0001 = n*(n-1)*trace(rho2*kron(P0_A0,P0_A1));
P0101 = n*(n-1)*trace(rho2*kron(P0_A0,P1_A1));
P0110 = n*(n-1)*trace(rho2*kron(P0_A1,P1_A0));
P1101 = n*(n-1)*trace(rho2*kron(P1_A0,P1_A1));

P0011 = n*(n-1)*trace(rho2*kron(P0_A1,P0_A1));
P0111 = n*(n-1)*trace(rho2*kron(P0_A1,P1_A1));
P1111 = n*(n-1)*trace(rho2*kron(P1_A1,P1_A1));


p = [1, P00, P01, P10, P11, P0000, P0100, P1100, P0101, P0110, P0001, P1101, P0011, P0111, P1111];

% %1 P00 P01 P10 P11 P0000 P1000 P1100 P0101 P1001 P0010 P1110 P0011 P1011 P1111
% P00 = n*trace(rho2*kron(P0_A0,eye(3)));
% P01 = n*trace(rho2*kron(P0_A1,eye(3)));
% P10 = n*trace(rho2*kron(P1_A0,eye(3)));
% P11 = n*trace(rho2*kron(P1_A1,eye(3)));
% P0000 = n*(n-1)*trace(rho2*kron(P0_A0,P0_A0));
% P1000 = n*(n-1)*trace(rho2*kron(P1_A0,P0_A0));
% P1100 = n*(n-1)*trace(rho2*kron(P1_A0,P1_A0));
% P0101 = n*(n-1)*trace(rho2*kron(P0_A0,P1_A1));
% P1001 = n*(n-1)*trace(rho2*kron(P1_A0,P0_A1));
% P0010 = n*(n-1)*trace(rho2*kron(P0_A1,P0_A0));
% P1110 = n*(n-1)*trace(rho2*kron(P1_A1,P1_A0));
% P0011 = n*(n-1)*trace(rho2*kron(P0_A1,P0_A1));
% P1011 = n*(n-1)*trace(rho2*kron(P1_A1,P0_A1));
% P1111 = n*(n-1)*trace(rho2*kron(P1_A1,P1_A1));
% p = [1, P00, P01, P10, P11, P0000, P1000, P1100, P0101, P1001, P0010, P1110, P0011, P1011, P1111];

res=p;

end
