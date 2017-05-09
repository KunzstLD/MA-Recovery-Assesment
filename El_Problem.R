# This might be the key 
dt_1 = dt[,list(iteration,pop.size,pop.size.control),by="day"]
dt_1
# Write a function that takes the first value from pop.size and calculates the
# quotient of this value with all the other values of pop.size.control on the same day!
# then automate this function for all the other values in pop.size.
# Then the same procedure for all the other days 