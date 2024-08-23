% Nika Emami - ne2213 - HW4 ML

%%
load('teapots.mat');
imagesc(reshape(teapotImages(2,:), 38, 50))
colormap gray;
title('initial image');
%%
data_mean = mean(teapotImages);
cov_matrix = cov(teapotImages);
[eigenvecs, eigenvals] = eig(cov_matrix);
[eigenvals, idx] = sort(diag(eigenvals), 'descend');
eigenvecs = eigenvecs(:, idx);
n = 3;
top_n = eigenvecs(:, 1:n);
%%
for i = 1:n
    plot_eigvec(i, n, top_n);
end
%%
pca_data = zeros(size(teapotImages));
data_size = size(teapotImages, 1);

for i = 1:data_size
    img = teapotImages(i, :);
    img = img - data_mean;
    projection = top_n(:, 1:n)' * img';
    pca_img = data_mean' + top_n(:, 1:n) * projection;
    pca_data(i, :) = pca_img';
end
%%
indices = randperm(size(teapotImages, 1), 10);

for i = 1:10
    figure;
    
    subplot(1, 2, 1);
    imagesc(reshape(teapotImages(indices(i), :), 38, 50));
    colormap gray;
    title(['Initial Image ', num2str(i)]);

    subplot(1, 2, 2);
    imagesc(reshape(pca_data(indices(i), :), 38, 50));
    colormap gray;
    title(['PCA Image ', num2str(i)]);
end
%%
function plot_eigvec(i, n, top_eigenvecs)
    subplot(1, n, i);
    imagesc(reshape(top_eigenvecs(:, i), 38, 50));
    colormap gray;
    title(['Eigenvector ', num2str(i)]);
end