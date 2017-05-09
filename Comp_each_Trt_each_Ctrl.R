# Goal: compare each treatment with each control daywise
# Comparison means quotient (pop.size/pop.size.control)
# Changing data table in the form we can compare daywise pop. sizes
dt_1 = dt[,list(iteration,pop.size,pop.size.control),by="day"]
dt_1

# form subgroups according to the same day
# use split from data.table package to produce list with sub data frames
out = split(dt_1, f=dt_1$day)

# head(out, n=3)
# head(out[[1]]$pop.size.control)

# Loop works for one element of the list
quo_list= list()
out[[1]]$pop.size[1]
for (i in 1:length(out[[1]]$pop.size)){
  quo = out[[1]]$pop.size[i]/out[[1]]$pop.size.control
  quo_list[[i]] = quo
}
# head(quo_list, n=1)
# length(quo_list)

# But not for alle elements of the list: just produces zeros
test = lapply(X=out,FUN= function(x)
     for (i in 1:length(out[[1]]$pop.size)){
      out[[1]]$pop.size[i]/out[[1]]$pop.size.control
  }
)
# length(test)
# head(test,n=3)