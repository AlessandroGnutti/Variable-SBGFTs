clear
close all
clc

N = 8;
U = zeros(N^2, N^2, 40);
L = zeros(N^2, N^2, 40);

count = 0;
vec_sym = 2:0.5:N-1;
% UD
for s = vec_sym
    count = count +1;
    G = gsp_2dgrid(N);
    W = 0.1*full(G.W);
    W = updateAdjMtx_v2(W, 'lr', s);
%     G.coords(9:16, 1) = G.coords(9:16, 1) + 0.1;
%     G.coords(25:32, 1) = G.coords(25:32, 1) + 0.1;
%     G.coords(41:48, 1) = G.coords(41:48, 1) + 0.1;
%     G.coords(57:64, 1) = G.coords(57:64, 1) + 0.1;
%     figure; wgPlot(W, G.coords, 'edgeColorMap', jet)
%     figure; imagesc(W)
%     close all
    D = diag(sum(W,2));
    L(:,:,count) = D - W;  
    [U(:,:,count), ~] = eig(L(:,:,count)); 
end

% LR
for s = vec_sym
    count = count +1;
    G = gsp_2dgrid(N);
    W = 0.1*full(G.W);
    W = updateAdjMtx_v2(W, 'ud', s);
%     G.coords(1:8:end, 2) = G.coords(1:8:end, 2) + 0.1;
%     G.coords(3:8:end, 2) = G.coords(3:8:end, 2) + 0.1;
%     G.coords(5:8:end, 2) = G.coords(5:8:end, 2) + 0.1;
%     G.coords(7:8:end, 2) = G.coords(7:8:end, 2) + 0.1;
%     figure; wgPlot(W, G.coords, 'edgeColorMap', jet)
% %     imagesc(W)
%     pause()
%     close all
    D = diag(sum(W,2));
    L(:,:,count) = D - W;
%     fprintf('LR: %d\n', isbisymmetric(L))
    [U(:,:,count), ~] = eig(L(:,:,count)); 
end

vec_sym = 4:2*N-4;
% D
for s = vec_sym
    count = count +1;
    G = gsp_2dgrid(N);
    W = 0.1*full(G.W);
    W = updateAdjMtx_v2(W, 'd', s);
%     G.coords(1:8:end, 2) = G.coords(1:8:end, 2) + 0.1;
%     G.coords(3:8:end, 2) = G.coords(3:8:end, 2) + 0.1;
%     G.coords(5:8:end, 2) = G.coords(5:8:end, 2) + 0.1;
%     G.coords(7:8:end, 2) = G.coords(7:8:end, 2) + 0.1;
%     figure; wgPlot(W, G.coords, 'edgeColorMap', jet)
%     imagesc(W)
%     pause()
%     close all
    D = diag(sum(W,2));
    L(:,:,count) = D - W;
    [U(:,:,count), prova] = eig(L(:,:,count)); 
end

% AD
for s = vec_sym
    count = count +1;
    G = gsp_2dgrid(N);
    W = 0.1*full(G.W);
    W = updateAdjMtx_v2(W, 'ad', s);
%     G.coords(1:8:end, 2) = G.coords(1:8:end, 2) + 0.1;
%     G.coords(3:8:end, 2) = G.coords(3:8:end, 2) + 0.1;
%     G.coords(5:8:end, 2) = G.coords(5:8:end, 2) + 0.1;
%     G.coords(7:8:end, 2) = G.coords(7:8:end, 2) + 0.1;
%     figure; wgPlot(W, G.coords, 'edgeColorMap', jet)
%     imagesc(W)

%     close all
    D = diag(sum(W,2));
    L(:,:,count) = D - W;
    [U(:,:,count), ~] = eig(L(:,:,count)); 
end