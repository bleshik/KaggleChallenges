% check what is wrong with the algorithm.
m = size(data);
% lets split examples in two halfs, the first it for the training the secong half is for validation
m_max = round(m / 2);
n = size(data');
iter = 10;
% for what number we are going to calculate
c = 1;
% no regularization
lambda = 0;
% clear the figure
clg;
hold on;
% the size of steps
h = 1000;
for i = h:h:m_max-h
	X = data(1:i,2:n);
	X_cv = data(m_max+1:m_max + i,2:n);
	y = data(1:i,1);
	y_cv = data(m_max+1:m_max + i,1);

	% adds X^2 features to make bias lower
	X = [X X .^ 2];
	X_cv = [X_cv X_cv .^ 2];

	Thetas = oneVsAll(X, y, 10, 0, iter);
	J = lrFunc(Thetas(:, c), [ones(i, 1) X], y, lambda)
	plot(i, J, '.1');
	J = lrFunc(Thetas(:, c), [ones(i, 1) X_cv], y_cv, lambda)
	'-'
	plot(i, J, '.2');
	drawnow();
end
