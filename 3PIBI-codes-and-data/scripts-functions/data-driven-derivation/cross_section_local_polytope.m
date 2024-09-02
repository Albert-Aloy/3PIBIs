% Find and plot the boundary points of a cross-section of the local polytope
function res = cross_section_local_polytope(n, V, v1, v2)
% n is the number of parties
% V is the table containing the local deterministic strategies
% e.g., V = build_lds_table(n);
% Make sure that V has been computed/loaded for the same specified n
% v1, v2 are two 15-dimensional vectors defining the plane direction on which to get the cross-section

% create random directions if no directions were specified 
if exist('v1')==0||exist('v2')==0
    % random directions to cut
    v1=find_vec_rand(n); 
    v2=find_vec_rand(n);
else
end

V=V.V; % get the table from the variable
vMixed=[1,n/3*ones(1,4),n*(n-1)/9*ones(1,10)]; % maximally mixed point, to make sure the algorithm below starts from inside the set


% We try to make a convex combination combination now which gives mu*(cos(theta)*v1+sin(theta)*v2)
% We find the max lambda and plot (mu*cos(t), mu*sin(t));

% initialize the linear program and the figure
extr=[];
figure(1);
hold on
for theta = 0:.1:2*pi % theta is the angle being probed until we complete a full circle
    % the more discretize theta is, the more boundary points we obtain
    p=(v1*cos(theta) + v2*sin(theta));
    VV=[V',[0;-p]];
    b=vMixed;
    f=VV(1,:)*0;
    f(1,size(VV,2))=1;

    tmp=[];
%         options = optimoptions('linprog','MaxIter',1e2,'Algorithm','interior-point'); 
    [x,fval,exitflag] = linprog(-f,tmp,tmp,VV,b,zeros(size(VV,2),1),[])
    if exitflag ==-2
        display(t);display(p);
        warning('Infeasible!');
    else
    mu = x(size(VV,2),1);
    hPlot1 = plot(mu*cos(theta),mu*sin(theta),'go');

    % to make the plot prettier
    currentR = 0.6350;
    currentG = 0.0780;
    currentB = 0.1840;
    ColorCode  = [currentR currentG currentB]; % Dividing 255 gives you the 0-1 value. [0.85 0.47 0.32], [148 130 78]./255, [0.6350 0.0780 0.1840]
    hPlot1.MarkerEdgeColor = ColorCode; % Marker outside boundaries color
    tint_factor = 0.9;
    ColorCodeTint = [currentR*255+(255-currentR*255), currentG*255+(255-currentG*255), currentB*255+(255-currentB*255)]*tint_factor/255;
%         hPlot1.MarkerFaceColor = ColorCodeTint; % Marker inside filling color 
    hPlot1.MarkerSize = 6;

    extr=[extr;mu*cos(theta),mu*sin(theta)]; % store the found boundary point
    drawnow();

    % to draw an illustrative line between the plotted boundary points
    hPlot2=plot(extr(:,1),extr(:,2),'black');
    hPlot2.LineStyle = '--'; % changes the line style 
    hPlot2.LineWidth = 1; % changes the line Width, you can get thin lines as you wish.

    end
    hPlot1.MarkerHandle.LineWidth = 1;
end
    
res={v1, v2, extr};

end
