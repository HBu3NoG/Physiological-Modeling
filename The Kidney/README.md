Renal Lab

Model requires: renal_part01.m, renal_part02.m, calc_cX_4_7_13.m, calc_cX_4_7_14.m, calc_cX_4_7_28.m

Instructions: To complete this assignment you must do 2 things. 
1)	Answer the questions below in a Word document. Generate plots/measurements as necessary to explain your findings

2)	Commit your code changes for each step and push to Github classroom. 
a.	Clone the repository from the Github classroom.
b.	For each task make sure to commit both changes to the provided code as well as any scripts you generate. Also add figures associated with your findings to the repo as .jpg or .png files.


Task 1: Describe the following files. Add comments to each line defining parameters/functions
-	renal_part01.m
-	renal_part02.m
-	calc_cX_4_7_14 lines 23-36 and 56-72
-	calc_cX_4_7_13 Describe the differences in relation to calc_cX_4_7_14


Task 2: The function in section 1 has two different ways to perform integration 
(page 166 in the book). Add a for loop to evaluate the time it takes for various levels of 
Lmax and del_x. Make a plot of calculation time vs del_x and calculation time vs Lmax.


Task 3: Look at the two integration equation inside function calc_cX_4_7_14 
and describe why the calculation times are so different. How much slower is the 2nd approach?


Task 4: Using the code in renal_part01, change the definition of rho to be p(L) = a(Lmax -L)P. 
First, show that when p=0, we recover our uniform distribution of loop lengths. 
In your own words, what do p values of 1, 2, and 10 imply about the distribution?


Task 5: We are interested to see how the value of p affects the concentrating ability of the nephron population.
 Therefore, evaluate c(X) in terms of p, paying particular attention to c(Lmax). Make a table or graph showing how 
c(Lmax)/Co depends on p.  Explain what you believe to be the impact of p on concentrating ability


Task 6: For equations 4.7.13 and 4.7.28. we can use fixed point iteration to solve.
 An outline for this approach is shown in renal_part02.m. Add a for loop to complete multiple iterations 
and add a stopping criteria for when the change in c is less than 1%.


Task 7: Compare the results from 4.7.13 and 4.7.14. Explore and describe how the approximations vary as a function of c_star and rho?


Task 8: Modify the code to use calc_cX_4_7_28 and again describe the differences in the results.

