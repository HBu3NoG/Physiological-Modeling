function [ activation ] = activate(weights, inputs )
%Calculate neuron activation for an input.
% Compute <x,w> + bias 

activation = weights(end);

for i=1:(length(inputs)-1)
    activation = activation + weights(i).*inputs(i);
end


end

