function [ data_mat ] = prepare_output_dataset( dataset )
%Given a multiclass labeled vector, return a logic matrix on size (samples,
%labels).

% Add 1 if dataset's global minimum is a zero
if min(dataset(:))==0;
    dataset=dataset+1;
end
vect_length=max(dataset(:));


data_mat=zeros(size(dataset,1),vect_length);

for j=1:size(dataset,1)
    data_mat(j,dataset(j))=1;
end

end

