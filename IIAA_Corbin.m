function [Q] = IIAA_Corbin(x_vec,y_vec)
%IIAA_Corbin(x_vec,y_vec) Takes two input vectors and 
%uses the interatied inverse approximation algorithm
%and outputs a matrix with the calculated values.
%
%x_vec: distinct numbers on the intervals
%y_vec: y_n = f(x_n)
%Q: output matrix

if (size(x_vec) != size(y_vec))
	error('Invalid inputs. Size of x_vec does not equal y_vec.')
end

for k 2:size(x_vec)
	for l 2:k
		Q(k,l)=(y(k)*Q(k-1,l-1)-y(k-l+1)*Q(k,l-1))/(y(k)-y(k-l+1))
	end
end

end