module logistic_regression

	implicit none

	real(8), dimension(9) :: x = (/ 1,2,3,4,5,6,7,8,9 /),sigmoid_x, y = (/ 0,0,0,0,0,1,1,1,1 /)
	integer, parameter :: length = size(x)

	contains

		!!!!!
		subroutine sigmoid(x,sigmoid_x)

			implicit none

			real(8), intent(in), dimension(length) :: x
			real(8), intent(out), dimension(length) :: sigmoid_x


			sigmoid_x = (1+exp(-x))**(-1)

		end subroutine sigmoid

		!!!!!
		subroutine logistic (xx, weights, cost)

			implicit none 

			real(8), intent(out) :: cost
			real(8), dimension(2) :: weights
			real(8), intent(in), dimension(2) :: xx

			weights = weights + xx

			call sigmoid(weights(1)+weights(2)*x,sigmoid_x)

			cost = - 1. / length * sum( y*log(sigmoid_x) + (1-y)*log(1-sigmoid_x) )

		end subroutine logistic

		subroutine predict (weights, x, y_hat)

			real(8), intent(out), dimension(length) :: y_hat
			real(8), intent(in), dimension(length) :: x
			real(8), intent(in), dimension(2) :: weights

			call sigmoid(weights(1)+weights(2)*x, y_hat)

		end subroutine predict

end module logistic_regression