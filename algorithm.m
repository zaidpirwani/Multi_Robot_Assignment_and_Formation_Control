clc; clear all; clear global; clear variables; close all;
% figure; hold on; grid on;
% axis square;

N = 4;
tau0 = 0;
theta0 = 0;

% Robots
X = [([5, 5])
     ([2, 4])
     ([4, 4])
     ([5, 1])
    ];
% Formation
P = [([3,3])
     ([2,2])
     ([5,9])
     ([1,0])
    ];
        
centroid = sum(P)./N;
for i=1:N
    P(i,:) = P(i,:)-centroid;
end
centroid = sum(P)./N;

tau = tau0;
theta = theta0;
R = [ cos(theta) -sin(theta); 
      sin(theta),  cos(theta)
    ];

L = 0;
costMatrix = zeros(N,N);
for i=1:N   
    for j=1:N   
        costMatrix(i,j) = norm(R*P(j,:)'+tau-X(i,:)')^2;
    end
end
costMatrix
[ass,cost] = munkres(costMatrix)