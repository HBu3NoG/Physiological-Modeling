function [ nl_data ] = prepare_input_dataset( dataset )
%Prepare dataset by normalizing the array between 0 - 1 using
% (x-min)/(max/min). Where max and min are the extrema of the
% whole dataset.

% Extrema
min_data=min(dataset);
max_data=max(dataset);

% Vectorize extrema (dont think it is necessary)
min_rep=repmat(min_data,size(dataset,1),1);
max_rep=repmat(max_data,size(dataset,1),1);

% Normallize data between 0-1.
nl_data=(dataset-min_rep)./(max_rep - min_rep);

end

