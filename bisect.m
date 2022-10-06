function [x,its,n_vec,a_vec,b_vec,p_vec,f_vec] = bisect(func,a,b,tol,MaxIt)
%bisect(func,a,b,tol,MaxIt) - Finds a solution to f(x)=0 on the interval 
%[a,b] via the Bisection Method. 
%
%The inputs are: 
%func = the function f, 
%a and b = the endpoints of the interval [a,b], 
%tol = the accuracy to which we want to solve the problem,
%MaxIt = the maximum number of iterations allowed. 
%
%The outputs are:
%x = bisect(func,a,b,tol,MaxIt) returns the particular x value for which 
%f(x)=0,
%[x,its] = bisect(func,a,b,tol,MaxIt) returns the particular x value for 
%which f(x)=0 and the number of iterations needed to converge to the 
%solution,
%[x,its,n_vec] = bisect(func,a,b,tol,MaxIt) returns the first two outputs 
%and a column vector storing the iteration count,
%[x,its,n_vec,a_vec] = bisect(func,a,b,tol,MaxIt) returns the first three 
%outputs and a column vector storing the a_i endpoints,
%[x,its,n_vec,a_vec,b_vec] = bisect(func,a,b,tol,MaxIt) returns the first  
%four outputs and a column vector storing the b_i endpoints,
%[x,its,n_vec,a_vec,b_vec,p_vec] = bisect(func,a,b,tol,MaxIt) returns the 
%first five outputs and a column vector storing the p_i midpoints,
%[x,its,n_vec,a_vec,b_vec,p_vec,f_vec] = bisect(func,a,b,tol,MaxIt) returns 
%the first six outputs and a column vector storing the function values of 
%the midpoints p.

%Begin code.
% Check the sign of the initial interval. Stop if same sign.
if sign(func(a))*sign(func(b)) > 0 
    error('f(a) and f(b) must have different signs');
end
% Initialize storage vectors.
n_vec = []; a_vec = []; b_vec = []; p_vec = []; f_vec = [];

% Begin Algorithm 2.1.
% Step 1 - Initialize proceedure.
n = 1; % (n is used instead of i to avoid confusion with complex numbers.)
FA = func(a); 
n_vec = [n_vec;n]; % Store iteration count.
a_vec = [a_vec;a]; % Store endpoint a.
b_vec = [b_vec;b]; % Store endpoint b.
% Step 2 - Enter while loop.
while n <= MaxIt
    % Step 3 - Compute p_n.
    IntLenHalf = (b-a)/2;
    p = a + IntLenHalf;
    FP = func(p);
    p_vec = [p_vec;p]; % Store midpoint p.
    f_vec = [f_vec;FP]; % Store function value.
% Step 4 - Determine whether to stop.
    if (IntLenHalf < tol || FP == 0)
        x = p; % Output solution.
        its = n; % Output number of iterations.
        break;
    else
        % Step 5 - Move iteration forward.
        n = n+1;
        n_vec = [n_vec;n]; % Store iteration count.
        % Step 6 - Reassign end points.
        if sign(FA)*sign(FP) > 0
            a = p; 
            FA = FP;
            a_vec = [a_vec;a]; % Store endpoint a.
            b_vec = [b_vec;b]; % Store endpoint b.
        else
            b = p;
            a_vec = [a_vec;a]; % Store endpoint a.
            b_vec = [b_vec;b]; % Store endpoint b.
        end
    end
end
% Step 7 - Print unsuccessful statement if MaxIts reached or assign output.
if n > MaxIt
    sprintf('Method was unsuccessful after %d iterations', MaxIt)
    x = 'NA';
    its = n;
    p_vec = [p_vec;NaN];
    f_vec = [f_vec;NaN];
end
end

