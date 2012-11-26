function [J, grad] = lrFunc(Theta, X, y, lambda)
	[m n] = size(X);
	% hypothesis
	h = sigmoid(X * Theta);
	
	% regularized cost function
	J = sum(-y .* log(h) - (1 - y) .* log(1 - h)) / m + lambda/ 2 / m * sum(Theta(2:n) .^2);
	% gradient
	grad = zeros(n, 1);
	for i = 1:n
		grad(i) = sum((h - y) .* X(:,i)) / m;
	end
	grad += lambda * ([0 Theta(2:n)']') / m;
end
