Cross-bridging Lab

Model requires: crossbridge.m p.m popdens.m v.m

Instructions: To complete this assignment you must do 2 things. 
1)Answer the questions below in a Word document. Generate plots/measurements as necessary to explain your findings

2)Commit your code changes for each step and push to Github classroom. 
a.Clone the repository from the Github classroom.
b.For each task make sure to commit both changes to the provided code as well as any scripts you generate. Also add figures associated with your findings to the repo as .jpg or .png files.


Task 1: Describe the following files
•CV_ crossbridge.m: Uncommented lines
•p.m: Uncommented lines 
•popdens.m: Uncommented lines


Task 2: This model is different than Models 1 and 2 in that it is not based on differential equations that govern the model but uses random numbers. Where are the random numbers utilized?


Task 3: Run crossbridge.m for several different velocities V and plot a few points of a force-velocity curve. Add the theoretical curve onto the same plot.


Task 4: Compare the population densities for each V with theoretical values. 


Task 5: How do the values compare for increasing (or decreasing values of n0)? How does dt affect the result?


Task 6: Modify input v(t) so that v(t) = 0 for t < Tstart and v(t) = V * sin ( 2 * pi * f * (t – tStart) ) for t>tStart. What is the meaning of tstart? What is effect on the simulation? How long does it take for the waveform to settle into a periodic steady state?


Task 7: What does the force waveform look like for small V? How is it affected by increasing V?


Task 8: For small v, you can fit the force vwaeform to P(t) = P0 + P1 * sin (2 * pi * f * (t – tStart) – phi). Only fit the steady state portion. How do P1 and phi vary with different f? Plot P1 vs f on a log-log plot and phi vs f on a semi-log plot (log(f) but not on phi).


Task 9: Modify the code so that crossbridges instantaneously detach when displacement is greater than B (where B>A). Modify crossbridge.m by inserting change = change | (x>B) right after line on which change is first defined. What happens to the force-velocity curves of shortening and lengthening?

