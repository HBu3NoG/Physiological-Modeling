function [ network ] = backward_propagate_error( network, expected )
%Backpropagate error and store in weights of neurons

for j=size(network,1):-1:1
    
    layer=network(j,:);
    n_neurons=numel(find(~cellfun(@isempty,layer)));
    
    if j==size(network,1)
        for k=1:n_neurons
            layer{1,k}.error = expected(k) - layer{1,k}.output;
        end
        
    else
        layer_above = network(j+1,:);
        n_neurons_above=numel(find(~cellfun(@isempty,layer_above)));
    
        for k=1:n_neurons
            error=0;
            for k2=1:n_neurons_above
                error=error+layer_above{1,k2}.weights(k)*layer_above{1,k2}.delta;
            end
            
            layer{1,k}.error=error;
        end
    end
    
    for k=1:n_neurons
        layer{1,k}.delta = layer{1,k}.error*transfer_derivative(layer{1,k}.output);
    end
    network(j,:)=layer; 
end

