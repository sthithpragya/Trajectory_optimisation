Each folder contains 5 matlab files:

1) distance - function to calculate the path distance for a given configuration of guess points

2) constraint_helper - function which computes the constraint value for a given segment and circular constraint

3) constraint - function which calculates the overall constraint value vector for all segment and circle pairs (by looping the constraint_helper fucntion)

4) objective - function which plots graphs and computes the optimal point positions

5) init - file to set the guess points and circular constraints

>> RUN the init file << 