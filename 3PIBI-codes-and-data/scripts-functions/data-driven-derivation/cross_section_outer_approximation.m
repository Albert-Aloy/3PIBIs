% Find and plot the boundary points of a cross-section of the outer approximation to the local polytope
function res = cross_section_outer_approximation(n, M, v1, v2) 
% n is the number of parties
% M are the constraints, in the text referred to as $\tilde{\Gamma}$. For example call, M = import_constraints('data-driven-out.mat'); 
% make sure that M has been computed/loaded for the same specified n
% v1, v2 are two 15-dimensional vectors defining the plane direction on which to get the cross-section

% if no directions were specified as inputs, create some random directions 
if exist('v1')==0||exist('v2')==0
    % random directions to cut
    v1=find_vec_rand(n); 
    v2=find_vec_rand(n);
else
end

% maximally mixed point, to make sure the algorithm below starts from inside the set
vMixed = [1, n/3*ones(1,4), n*(n-1)/9*ones(1,10)];

% initialize figure and variables
figure(1);
hold on
H=[];
extr=[];
% initialize for loop to do a full circle looking for the boundary point
% the more steps the discretization of the circle has, the more accurate approximation of the cross-section one obtains
for theta = 0:.1:2*pi % theta is the current angle being probed
    P = [0, v1'*cos(theta)]+[0, v2'*sin(theta)]+[1, 0*v1']; % define the current direction
    sdp_result = data_driven_sdp_lambda_cross_section(M, P, vMixed); % use the sdp to find the boundary point along direction P of the set specified by M, starting from vMixed
    lambda = sdp_result{1}; x = sdp_result{2};

    hPlot = plot(lambda*cos(theta), lambda*sin(theta), 'x'); % plot the boundary point

    % parameters to make the plot prettier
    currentR = 0;
    currentG = 0.51;
    currentB = 0.78;
    ColorCode  = [currentR currentG currentB];    
    hPlot.MarkerEdgeColor = ColorCode;
    hPlot.MarkerSize = 10; 
    tint_factor = 0.9;
    
    extr = [extr; lambda*cos(theta), lambda*sin(theta)]; % store the boundary point
    % to draw an illustrative line uniting boundary points
    hPlot2 = plot(extr(:,1),extr(:,2));
    hPlot2.Color = ColorCode;
    hPlot2.LineStyle = ':'; % changes the line style 
    hPlot2.LineWidth = 1; % changes the line Width, you can get thin lines as you wish.
    H = [H; sdp_result{3}]; % store the sdp results

   drawnow();
   hPlot.MarkerHandle.LineWidth = 1;
end

res = {H v1 v2 extr};

end