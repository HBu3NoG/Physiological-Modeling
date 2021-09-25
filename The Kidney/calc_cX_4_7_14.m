function [cX] = calc_cX_4_7_14(L,rho,c0,del_x,int_flag)
%calc_cX_4_7_13 Calculate c(X) according to equation 4.7.13



if int_flag ==1 % Integrate via manual trapz or trapz func
    
    [func_comb]=integrate_trapz_manual(L,rho,del_x);
    
else
    [func_comb]=integrate_trapz(L,rho);
    
end

cX=c0*exp(func_comb);

end



function [func_comb]=integrate_trapz_manual(L,rho,del_x)

data_num = rho;         % Numerator of function to integrate.
data_denom = L.*rho;    % Denominator of function to integrate.

for x=numel(L):-1:1
    
    % Trapezoidal integration of aforementioned functions with respect to
    % length.
    if x==numel(L)
        func_num(x)     = 0;    % Vector should represent number of loops from x to Lmax
        func_denom(x)   = 0;     
        func_ratio(x)   = 0;    
    else
        func_num(x)     = func_num(x+1) + del_x*(data_num(x+1) + data_num(x))/2;
        func_denom(x)   = func_denom(x+1) + del_x*(data_denom(x+1) + data_denom(x))/2;
        func_ratio(x)   = func_num(x) ./ func_denom(x);
    end
    
end

    % Trapezoidal integration with respect to position in the loop on Henle
    % population model. 
for x=1:numel(L)
    
    if x==1
        func_comb(x)     = 0;
        
    else
        func_comb(x)     = func_comb(x-1) + del_x*(func_ratio(x-1) + func_ratio(x))/2;
    end
end

end


function [func_comb]=integrate_trapz(L,rho)

data_num = rho;         % Numerator of function to integrate
data_denom = L.*rho;    % Denominator of function to integrate

% Create a vector representing the function to be integrated with respect
% to x.
for x=1:numel(L)
    int_limit_inner = L(x:end);         % Create a vector from x to Lmax
    int_data_num    = data_num(x:end);  % for trapezoidal integration.
    int_data_denom  = data_denom(x:end);%
    
    if numel(int_limit_inner)==1
        func_num(x)    = 0;
        func_denom(x)  = 0;
        func_ratio(x)  = 0;
    else
        func_num(x)   = trapz(int_limit_inner,int_data_num);
        func_denom(x) = trapz(int_limit_inner,int_data_denom);
        func_ratio(x) = func_num(x) ./ func_denom(x);
    end
    
end

% Create a proportional interstial concentration vector by integrating 
% the previous function using trapezoidal methods.
for x=1:numel(L)
    
    int_limit_outer = L(1:x);
    int_data_ratio=func_ratio(1:x);
    
    if numel(int_limit_outer)==1
        func_comb(x)=0;
    else
        func_comb(x) = trapz(int_limit_outer,int_data_ratio);
    end
end

end
