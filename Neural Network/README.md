Perceptron Lab


The code is based on this python implementation: https://machinelearningmastery.com/implement-backpropagation-algorithm-scratch-python/

Instructions: To complete this assignment you must do 2 things. 
1)	Answer the questions below in a Word document. Generate plots/measurements as necessary to explain your findings

2)	Commit your code changes for each step and push to Github classroom. 
a.	Clone the repository from the Github classroom.
b.	For each task make sure to commit both changes to the provided code as well as any scripts you generate. Also add figures associated with your findings to the repo as .jpg or .png files.


The seed data provided is 210 samples of 7 measurements for 3 different types of seed. The measurements are 1) area, 
2) perimeter, 3) compactness, 4) length, 5) width, 6) asymmetry, and 7) length of grove. The 3 seed types are Kama,
 Rosa and Canadian wheat (labeled in column 8). The goal is to create a NN which identifies the correct seed type 
based on a vector of these features.


Task 1: Starting with script_seed, comment each section of code. This will entail more work than previous labs. 
How many inputs does the model have? How many outputs? How many layers?


Task 2: Currently, the code uses 180 out of 210 cases to train and then tests the accuracy on the remaining 30 cases. 
Modify script_seed so that you perform cross-validation. What this means is you repeat this approach but leave out a 
different 30 cases. In this example, you would perform 7 different trainings.


Task 3: How does the accuracy change for each cross-validation. 
Compare selecting 30 consecutive cases for testing as opposed to 30 random cases (as the test script does).


Task 5: Evaluate the accuracy (and uncertainty in accuracy) as a function of training data. On one extreme, train with 
200 cases and test on 10. On the other, train on 10 and test with 200. What do you find to be the optimal value?


Task 6: What is the effect of the learning rate? For example, after 200 epochs, how does the residual error and accuracy 
vary with different learning rates?


Task 7: Implement an approach that decreases the learning rate based on the epoch number. Does this improve your performance?


Task 8: Modify your learning rate modification to be based on change in residual error. The goal is to decrease learning if
 you observe your error is plateauing. Does this improve you performance?


Task 9: Currently, the network has 5 hidden neurons. How does the performance change with more or less neurons?
