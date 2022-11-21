function [Q] = project_opt1_IIA_Rochelle(x_vec,y_vec)
%IIAA_Corbin(x_vec,y_vec) Takes two input vectors and 
%uses the interatied inverse approximation algorithm
%and outputs a matrix with the calculated values.
%
%x_vec: distinct numbers on the intervals
%y_vec: y_n = f(x_n)
%Q: output matrix

if (size(x_vec) ~= size(y_vec))
	error('Invalid inputs. Size of x_vec does not equal y_vec.')
end

Q = zeros(size(y_vec,2));
Q(:,1) = x_vec;

for k = 2:size(y_vec,2)
	for l = 2:k
		Q(k,l)=(y_vec(k)*Q(k-1,l-1)-y_vec(k-l+1)*Q(k,l-1))/(y_vec(k)-y_vec(k-l+1));
	end
end

end