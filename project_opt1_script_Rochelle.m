% This is Corbin T Rochelle Script file for the final project.

format longg;
func = @(x) x-exp(-x);

% Actual Value
actual = fzero(func,0)

% Iterated Inverse
x_vec = [.3,.4,.5,.6];
y_vec = func(x_vec);
IIA = project_opt1_IIA_Rochelle(x_vec,y_vec)
ii = @() project_opt1_IIA_Rochelle(x_vec,y_vec);
IIA_time = timeit(ii)
IIA_diff = abs(actual - IIA)

% Newton's Method
dfunc = @(x) 1+exp(-x);
guess = .45;
tol = 10.^(-15);
NM = NM_Diegel(guess,func,dfunc,tol,100)
nm = @() NM_Diegel(guess,func,dfunc,tol,100);
NM_time = timeit(nm)
NM_diff = abs(actual - NM)

% Bisection Method
B = bisect(func,0,1,tol,100)
b = @() bisect(func,0,1,tol,100);
B_time = timeit(b)
B_diff = abs(actual - B)

