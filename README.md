# Machine Learning Projects
Projects from the Machine Learning course, covering key algorithms and techniques such as linear perceptron, Support Vector Machines (SVM), Principal Component Analysis (PCA), Junction Tree, Polynomial Regression, and Logistic Regression.

##  1- Junction Tree algorithm (JTA) for a Markov chain with binary variables

This MATLAB code computes the pairwise marginal probability distributions for a Markov chain with binary variables.

### Input

- **n**: The number of binary variables in the Markov chain.
- **potentials**: A cell array of size `n−1`, where each cell contains a `2x2` matrix representing the potential function of the corresponding edge in the chain.

### Output

- A cell array of size `n−1`, where each cell contains the marginal probability distribution for the corresponding pair of variables.

### Steps Implemented

1. **Initialization**: 
   - Create a matrix to store the messages passed between cliques in the Markov chain.

2. **Left-to-Right Message Passing**:
   - Compute messages from each clique to the next clique in the chain. This involves sequentially passing information from the leftmost variable to the rightmost variable, using the potential functions provided.

3. **Right-to-Left Message Passing**:
   - Compute messages from each clique to the previous clique in the chain. This step involves propagating information in the reverse direction, from the rightmost variable back to the leftmost variable.

4. **Marginal Computation**:
   - Calculate the pairwise marginal probability distributions for each pair of variables based on the messages obtained from the previous steps. This involves combining the messages to determine the probability distribution over the binary variables.
  
