function [ network, output] = forward_propagate(network, input)
%Forward propagate input to a network output
input_val=input;

% Loop through all nonempty neurons in network.
% Start with Layers
for j=1:size(network,1)
    clear output
    layer=network(j,:);
    n_neurons=numel(find(~cellfun(@isempty,layer)));
    
    
    %Loop through neurons in layer.
    for k=1:n_neurons

        neuron=network{j,k};

        neuron.input = input_val;
        
        activation = activate(neuron.weights, neuron.input);
        neuron.output = transfer(activation);

        output(k)=neuron.output;

        network{j,k}=neuron;
    end
    
    % Change input-val to be the output of the previous layer.
    input_val=output;
end


