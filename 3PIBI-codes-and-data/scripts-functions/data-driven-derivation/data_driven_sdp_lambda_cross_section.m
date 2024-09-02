function res = data_driven_sdp_lambda_cross_section(M, P, vMixed) 
% starts from the point vMixed and maximizes over the direction P to find 
% the boundary point of the set with constrains specificed by M
%
% M contains the matrices specifying the constraints of the outer approximation, in the text referred to as $\tilde{\Gamma}$
% e.g., M = import_constraints('data-driven-out.mat');
% P is a vector containing the collective conditional probabilities. Here it specifies a direction in the 15-dimensional space
% e.g. P = [1, P00, P01, P10, P11, P0000, P0100, P1100, P0101, P0110, P0001, P1101, P0011, P0111, P1111];
%
%  Initialize the sdp with CVX and sedumi
G=zeros(size(M{1}));
cvx_begin sdp
% cvx_precision high
cvx_solver sedumi
        variable v(1,numel(M));
        dual variable y{15};
        variable lambda(1,1) nonnegative;
        
            for i = 1:numel(M)
                G=G+v(i)*M{i};
            end
            
        maximize(lambda)
        
        subject to
            G==semidefinite(size(M{1})); 
            lambda==semidefinite(1,1);
            y{1}:G(1,1) == 1;
            y{2}:G(1,2)==lambda*P(1,2)+vMixed(1,2);
            y{3}:G(1,3)==lambda*P(1,3)+vMixed(1,3);
            y{4}:G(1,4)==lambda*P(1,4)+vMixed(1,4);
            y{5}:G(1,5)==lambda*P(1,5)+vMixed(1,5);
            y{6}:G(1,6)==lambda*P(1,6)+vMixed(1,6);
            y{7}:G(1,7)==lambda*P(1,7)+vMixed(1,7);
            y{8}:G(1,8)==lambda*P(1,8)+vMixed(1,8);
            y{9}:G(1,9)==lambda*P(1,9)+vMixed(1,9);
            y{10}:G(1,10)==lambda*P(1,10)+vMixed(1,10);
            y{11}:G(1,11)==lambda*P(1,11)+vMixed(1,11);
            y{12}:G(1,12)==lambda*P(1,12)+vMixed(1,12);
            y{13}:G(1,13)==lambda*P(1,13)+vMixed(1,13);
            y{14}:G(1,14)==lambda*P(1,14)+vMixed(1,14);
            y{15}:G(1,15)==lambda*P(1,15)+vMixed(1,15);     
cvx_end
x=cvx_status;
H=[];
for i=1:15 
    H=[H -y{i}]; 
end 
res={lambda x H};
  

% using YALMIP instead
% G=zeros(size(M{1}));
% v=sdpvar(1,numel(M),'full','real');
% lambda=sdpvar(1,1,'symmetric','real');
% ops = sdpsettings('solver','mosek'); % some solvers are 'mosek' 'sedumi' or 'sdpt3'
% for i = 1:numel(M)
%     G=G+v(i)*M{i};
% end
% 
% constr1=[G(1,1)==1];
% constr2=[G(1,2)==lambda*P(1,2)+vMixed(1,2)];
% constr3=[G(1,3)==lambda*P(1,3)+vMixed(1,3)];
% constr4=[G(1,4)==lambda*P(1,4)+vMixed(1,4)];
% constr5=[G(1,5)==lambda*P(1,5)+vMixed(1,5)];
% constr6=[G(1,6)==lambda*P(1,6)+vMixed(1,6)];
% constr7=[G(1,7)==lambda*P(1,7)+vMixed(1,7)];
% constr8=[G(1,8)==lambda*P(1,8)+vMixed(1,8)];
% constr9=[G(1,9)==lambda*P(1,9)+vMixed(1,9)];
% constr10=[G(1,10)==lambda*P(1,10)+vMixed(1,10)];
% constr11=[G(1,11)==lambda*P(1,11)+vMixed(1,11)];
% constr12=[G(1,12)==lambda*P(1,12)+vMixed(1,12)];
% constr13=[G(1,13)==lambda*P(1,13)+vMixed(1,13)];
% constr14=[G(1,14)==lambda*P(1,14)+vMixed(1,14)];
% constr15=[G(1,15)==lambda*P(1,15)+vMixed(1,15)];
% 
% x=solvesdp([G>=0,lambda>=0, constr1,constr2,constr3,constr4,constr5,constr6,constr7,constr8,constr9,constr10,constr11,constr12,constr13,constr14,constr15],-lambda,ops)
% H=[dual(constr1) dual(constr2) dual(constr3) dual(constr4) dual(constr5) dual(constr6) dual(constr7) dual(constr8) dual(constr9) dual(constr10) dual(constr11) dual(constr12) dual(constr13) dual(constr14) dual(constr15)];

% res={double(lambda) x H};

end