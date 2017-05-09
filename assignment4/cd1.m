function ret = cd1(rbm_w, visible_state)
% <rbm_w> is a matrix of size <number of hidden units> by <number of visible units>
% <visible_data> is a (possibly but not necessarily binary) matrix of size <number of visible units> by <number of data cases>
% The returned value is the gradient approximation produced by CD-1. It's of the same shape as <rbm_w>.
    %error('not yet implemented');
    visible_state = sample_bernoulli(visible_state);
    hidden_probability = visible_state_to_hidden_probabilities(rbm_w, visible_state);
    hidden_state = sample_bernoulli(hidden_probability);
    dw0 = configuration_goodness_gradient(visible_state, hidden_state);
    re_visible_probability = hidden_state_to_visible_probabilities(rbm_w, hidden_state);
    re_visible_state = sample_bernoulli(re_visible_probability);
    re_hidden_probability = visible_state_to_hidden_probabilities(rbm_w, re_visible_state);
    %re_hidden_state = sample_bernoulli(re_hidden_probability);
    dw1 = configuration_goodness_gradient(re_visible_state, re_hidden_probability);
    ret = dw0 - dw1;
end
