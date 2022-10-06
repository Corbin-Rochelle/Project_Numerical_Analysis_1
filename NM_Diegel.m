function [sol,its,n_vec,sol_vec] = NM_Diegel(init_gss,func,dfunc,Tol,MaxIt)
%NM_Diegel(initial_guess,func,dfunc,Tol,MaxIt) - Finds a 
%solution to f(x) = 0 via Newton's Method.
%
%The inputs are:
%init_gss = an initial approximation of the solution,
%func = the function f, 
%dfunc = the derivative of the function f,
%Tol = the accuracy to which we want to solve the problem (relative tol),
%MaxIt = the maximum number of iterations allowed. 
%
%The outputs are:
%sol = NM_Diegel(init_gss,func,dfunc,Tol,MaxIt) returns the value of x for 
%which f(x) = 0,
%[sol,its] = NM_Diegel(init_gss,func,dfunc,Tol,MaxIt) returns the value 
%of x for which f(x) = 0 and the number of iterations needed to converge,
%[sol,its,n_vec] = NM_Diegel(init_gss,func,dfunc,Tol,MaxIt) returns the
%first two outputs and a column vector storing the iteration count,
%[sol,its,n_vec,sol_vec] = NM_Diegel(init_gss,func,dfunc,Tol,MaxIt) returns 
%the first three outputs and a column vector storing the approximations at
%each interation.

sol_vec = init_gss;
sol_prev = init_gss;
error = 1;
counter = 0;
n_vec = 0;

while error > Tol
   
    sol = sol_prev - func(sol_prev)/dfunc(sol_prev);
    sol_vec = [sol_vec;sol];
    
    error = abs((sol_prev - sol)/sol_prev);
    
    counter = counter + 1;
    n_vec = [n_vec;counter];
    
    if counter > MaxIt
        break
    else
        sol_prev = sol;
        its = counter;
    end
    
end

% Print unsuccessful statement if reached, assign solution value otherwise.
if counter > MaxIt
    sol = sprintf('Method was unsuccessful after %d iterations', MaxIt);
    its = counter;
end

end

