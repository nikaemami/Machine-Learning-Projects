% random matrices for psis
n = 5;
psis = cell(n-1, 1);
for i = 1 : (n-1)
    psis{i} = rand(2,2);
end

% Call MarkovJunctionTree function with generated psis
marginals = MarkovJunctionTree(psis);

% Test the MarkovJunctionTree function with predefined psis_test
psis_test = cell(4, 1);
psis_test{1} = [0.1, 0.7; 0.8, 0.3]; 
psis_test{2} = [0.5, 0.1; 0.1, 0.5];
psis_test{3} = [0.1, 0.5; 0.5, 0.1];
psis_test{4} = [0.9, 0.3; 0.1, 0.3];
test_marginals = MarkovJunctionTree(psis_test)

% the MarkovJunctionTree function

function marginals = MarkovJunctionTree(potential)
    % Junction tree algorithm
    m = size(potential,1);
    marginals = potential;
    separators = ones (m-1, 2);

    % Forward message passing
    for i = 1 : (m - 1)
        % Update the separator
        separators(i, :) = sum(marginals{i});
        % Update the next marginal
        marginals{i+1} = marginals{i+1}.*(transpose(separators(i,:)));
    end

    % Backward message passing
    for j = 1 : (m - 1)
        old_separator = separators(m-j,:);
        separators(m - j,:) = sum(marginals{m - j + 1}, 2)';
        marginals{m - j} = marginals{m - j}.*((separators(m - j,:)./old_separator));
    end

    for k = 1 : m
        marginals{k} = marginals{k}/(sum(sum(marginals{k})));
    end 
end