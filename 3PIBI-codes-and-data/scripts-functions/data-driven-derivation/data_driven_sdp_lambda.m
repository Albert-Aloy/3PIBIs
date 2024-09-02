function res = data_driven_sdp_lambda(M, Pdata) 
% M are the constraints, in the text referred to as $\tilde{\Gamma}$. For example call, M = import_constraints('data-driven-out.mat'); 
% Pdata is a vector containing the collective conditional probabilities.
% The ordering of Pdata is expected to be:
% Pdata = [1, P00, P01, P10, P11, P0000, P0100, P1100, P0101, P0110, P0001, P1101, P0011, P0111, P1111];

%  CVX lambda
G=zeros(size(M{1}));
cvx_begin sdp 
cvx_precision high 
cvx_solver sdpt3 % cvx_solver_settings('maxit',1500)
% cvx_solver sedumi
        variable y(1,numel(M)); 
        dual variable alphadual{15}; 
        variable lambda(1,1);

            for i = 1:numel(M)
                G=G+y(i)*M{i};
            end

        maximize(lambda) 

        subject to
            G==semidefinite(size(M{1})); 
            lambda==semidefinite(1,1);
            alphadual{1}:G(1,1) == 1;
            alphadual{2}:G(1,2)==lambda*Pdata(1,2);
            alphadual{3}:G(1,3)==lambda*Pdata(1,3);
            alphadual{4}:G(1,4)==lambda*Pdata(1,4);
            alphadual{5}:G(1,5)==lambda*Pdata(1,5);
            alphadual{6}:G(1,6)==lambda*Pdata(1,6);
            alphadual{7}:G(1,7)==lambda*Pdata(1,7);
            alphadual{8}:G(1,8)==lambda*Pdata(1,8);
            alphadual{9}:G(1,9)==lambda*Pdata(1,9);
            alphadual{10}:G(1,10)==lambda*Pdata(1,10);
            alphadual{11}:G(1,11)==lambda*Pdata(1,11);
            alphadual{12}:G(1,12)==lambda*Pdata(1,12);
            alphadual{13}:G(1,13)==lambda*Pdata(1,13);
            alphadual{14}:G(1,14)==lambda*Pdata(1,14);
            alphadual{15}:G(1,15)==lambda*Pdata(1,15);
cvx_end 
x = cvx_status; 
H=[]; 
for i=1:15
    H=[H -alphadual{i}];
end
% 
% %  using YALMIP instead of CVX
% G=zeros(size(M{1}));
% v=sdpvar(1,numel(M),'full','real');
% lambda=sdpvar(1,1);
% ops = sdpsettings('solver','mosek');
% for i = 1:numel(M)
%     G=G+v(i)*M{i};
% end
% 
% 
% constr1=[G(1,1)==1];
% constr2=[G(1,2)==lambda*Pdata(1,2)];
% constr3=[G(1,3)==lambda*Pdata(1,3)];
% constr4=[G(1,4)==lambda*Pdata(1,4)];
% constr5=[G(1,5)==lambda*Pdata(1,5)];
% constr6=[G(1,6)==lambda*Pdata(1,6)];
% constr7=[G(1,7)==lambda*Pdata(1,7)];
% constr8=[G(1,8)==lambda*Pdata(1,8)];
% constr9=[G(1,9)==lambda*Pdata(1,9)];
% constr10=[G(1,10)==lambda*Pdata(1,10)];
% constr11=[G(1,11)==lambda*Pdata(1,11)];
% constr12=[G(1,12)==lambda*Pdata(1,12)];
% constr13=[G(1,13)==lambda*Pdata(1,13)];
% constr14=[G(1,14)==lambda*Pdata(1,14)];
% constr15=[G(1,15)==lambda*Pdata(1,15)];
% 
% x=solvesdp([G>=0, constr1,constr2,constr3,constr4,constr5,constr6,constr7,constr8,constr9,constr10,constr11,constr12,constr13,constr14,constr15],0,ops)
% H=[dual(constr1) dual(constr2) dual(constr3) dual(constr4) dual(constr5) dual(constr6) dual(constr7) dual(constr8) dual(constr9) dual(constr10) dual(constr11) dual(constr12) dual(constr13) dual(constr14) dual(constr15)];

res={x H lambda};
end