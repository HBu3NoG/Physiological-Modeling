function [test]=predict(net, test_data)
%Test performance

for j=1:size(test_data,1)
    input=test_data(j,:);
    [~,output] = forward_propagate(net, input);
    test(j)=find(output==max(output));
end


