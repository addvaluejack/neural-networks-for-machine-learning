function G = configuration_goodness(rbm_w, visible_state, hidden_state)
% <rbm_w> is a matrix of size <number of hidden units> by <number of visible units>
% <visible_state> is a binary matrix of size <number of visible units> by <number of configurations that we're handling in parallel>.
% <hidden_state> is a binary matrix of size <number of hidden units> by <number of configurations that we're handling in parallel>.
% This returns a scalar: the mean over cases of the goodness (negative energy) of the described configurations.
    tmpG = 0;
    for index = 1:size(visible_state, 2)
        tmp = hidden_state(:, index) * (visible_state(:, index))';
        tmpG = tmpG + sum(sum(rbm_w .* tmp));
    end
    G = tmpG / size(visible_state, 2);
end
