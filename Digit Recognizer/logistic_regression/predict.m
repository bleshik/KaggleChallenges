function p = predict(Thetas, X)
	X = [ones(size(X), 1) X];
	[x, p] = max(sigmoid(X * Thetas)');
	p -= 1;
end
