program driver
	use logistic_regression_diff
	implicit none

	real(8), dimension(2) :: xx = 0., weights = 0., xxb = 0.
	real(8) :: cost, costb = 1., alpha = 0.001
	integer :: iters = 0
	integer, parameter :: MAX_ITER = 100000
	real(8), dimension(length) :: y_hat

	do iters = 1, MAX_ITER 
		xx = 0.
		xxb = 0.
		costb = 1.
		call logistic(xx, weights, cost)
		call logistic_b(xx, xxb, weights, cost, costb)
		weights = weights - alpha*xxb
	end do

	call predict(weights, x, y_hat)
	print *, y_hat
end program driver