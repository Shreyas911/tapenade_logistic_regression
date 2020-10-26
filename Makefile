EXEC := logistic
SRC  := $(wildcard *.f90)
OBJ  := $(patsubst %.f90, %.o, $(SRC))
# NOTE - OBJ will not have the object files of c codes in it, this needs to be improved upon.
# Options	
F90 	:= gfortran

# Rules
$(EXEC): $(OBJ)
		$(F90) -o $@ $^

%.o: %.f90 
		$(F90) -c $<

driver.o: logistic_regression_b.f90 logistic_regression_diff.mod
logistic_regression_diff.mod: logistic_regression_b.o

logistic_regression_b.f90: logistic_regression.f90
		tapenade -reverse -head "logistic(cost)/(xx)" logistic_regression.f90

# Useful phony targets

.PHONY: clean

clean:
	$(RM) $(EXEC) *.o $(MOD) $(MSG) *.msg *.mod *_db.f90 *_b.f90 *_d.f90 *~