% Part 1
clear all

c0 = 1;             % Intial concentration entering the loop on Henle.
del_x=0.1;          % Interval sampled going down the concentration gradient.
Lmax=10;            % Total length of the loop of Henle.

L=0:del_x:Lmax;     % Length vector spanning the length of loop.

rho=2*ones(size(L));% Density of loops sampled at every dx.Is constant.

% Compute the concentration gradient vector using user-built trapezoidal
% integration and built-in matlab trapz() function.
for int_flag=1:2
    tstart(int_flag)=tic;
    
    [cX] = calc_cX_4_7_14(L,rho,c0,del_x,int_flag);
    
    telapsed(int_flag)=toc(tstart(int_flag));
end

%% Task 2.
% Add a for loop to evaluate the time elapsed when evaluation the integral
% at various values for Lmax and del_x.
clear

c0 = 1;                             % Intial concentration entering the loop on Henle.

% Evaluation of Lmax
del_x = 0.1;                        % Hold del_x constant.
Telapsed_Lmax = zeros(100,2);        % Pre-allocation
for Lmax = 1:100
    L=0:del_x:Lmax;                 % Length vector spanning the length of loop.
    rho=2*ones(size(L));            % Density of loops sampled at every dx.Is constant.
    
    % Compute the concentration gradient vector using user-built trapezoidal
    % integration and built-in matlab trapz() function.
    for int_flag=1:2
        tstart(int_flag)=tic;

        [cX] = calc_cX_4_7_14(L,rho,c0,del_x,int_flag);

        Telapsed_Lmax(Lmax,int_flag)=toc(tstart(int_flag));
    end
end

% Evaluation of del_x
clear del_x
Lmax = 10;

i = 1;      % Index
Telapsed_del_x = zeros(50,2);
for del_x = logspace(-2,1)
    L=0:del_x:Lmax;                 % Length vector spanning the length of loop.
    rho=2*ones(size(L));            % Density of loops sampled at every dx.Is constant.
    
    % Compute the concentration gradient vector using user-built trapezoidal
    % integration and built-in matlab trapz() function.
    for int_flag=1:2
        tstart(int_flag)=tic;

        [cX] = calc_cX_4_7_14(L,rho,c0,del_x,int_flag);

        Telapsed_del_x(i,int_flag)=toc(tstart(int_flag));
    end
    i = i+1;
end

figure(1)
semilogy(1:100,Telapsed_Lmax,'-o')


figure(2)
loglog(logspace(-2,1),Telapsed_del_x,'--o')
legend('Manual','Built-in')

%% Task 4. Different Density Distribution.
c0 = 1;
del_x=0.1;          % Interval sampled going down the concentration gradient.
Lmax=10;            % Total length of the loop of Henle.
L=0:del_x:Lmax;     % Length vector spanning the length of loop.

a = 2;
p = 0;
rho_old= 2*ones(size(L));% Density of loops sampled at every dx.Is constant.
rho_new= a*(Lmax-L).^p;
isequal(rho_old,rho_new)
%% Task 5. Evaluating impact of p.
c_end = zeros(10,1);
for p = 1:10
    rho = a*(Lmax-L).^p;
    
    % Compute the concentration gradient vector using user-built trapezoidal
    % integration and built-in matlab trapz() function.
    for int_flag=1:2
        tstart(int_flag)=tic;
        [cX] = calc_cX_4_7_14(L,rho,c0,del_x,int_flag);
        telapsed(int_flag)=toc(tstart(int_flag));
    end
    c_end(p) = cX(end)/c0;
    
end

figure(1)
hold
title('Concentrating Ability with varying p.')
xlabel('p')
ylabel('C()')
plot(c_end,'--o')

hold

%% Task 6. Fixed point Iteration

clear all

c0 = 1;         % Initial concentration at the beggining of DLH
del_x=0.1;      % Sampling interval 
Lmax=10;        % Maximum length a loop can be

L=0:del_x:Lmax; % Length vector with interval dx.

%rho=2*ones(size(L)); % Density function.
a = 2;
p = 10;
rho= a*(Lmax-L).^p;% Density of loops sampled at every dx.Is constant.


% Compute the concentration gradient using the assumption that
% c_star/c(L) << 1.
[c_orig] = calc_cX_4_7_14(L,rho,c0,del_x,1);

error = 10;
i = 0;
errorvec = [];
while error > 0.1
    i = i+1;
    % Compute the concetration gradient using the complete solution outlined in
    % 4.7.13 from the textbook.
    c_est = c_orig;
    [c_new] = calc_cX_4_7_13(L,rho,c_est,c_star,c0,del_x);
    error = norm(c_new-c_orig)/norm(c_new)*100;
    errorvec(i) = error;
    c_orig = c_new;
end

%% Equation comparison
N=15;

TotalError = zeros(N,10);
label = {};
j = 0;
for p = 1:10
    j = j+1;
    label{end+1} = num2str(p);
    a = 2;
    rho= a*(Lmax-L).^p;% Density of loops sampled at every dx.Is constant.

    % Compute the concentration gradient using the assumption that
    % c_star/c(L) << 1.
    [c_orig] = calc_cX_4_7_14(L,rho,c0,del_x,1);

    i = 0;
    c_star = 0.5
    for i = 1:10
        % Compute the concetration gradient using the complete solution outlined in
        % 4.7.13 from the textbook.
        c_est = c_orig;
        [c_new] = calc_cX_4_7_13(L,rho,c_est,c_star,c0,del_x);
        error = norm(c_new-c_orig)/norm(c_new)*100;
        TotalError(j,i) = error;
        c_orig = c_new;
    end
end