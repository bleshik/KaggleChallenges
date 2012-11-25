function Thetas = oneVsAll(X, y, num_labels, lambda, iter = 50)
	[m n] = size(X);
	X = [ones(m, 1) X];
	initial_theta = zeros(n + 1, 1);
	for c = 1:num_labels
		options = optimset('GradObj', 'On', 'MaxIter', iter);
		Thetas(:, c) = fminunc(@(t)lrFunc(t, X, (y == c-1), lambda), initial_theta, options);
	end
end
