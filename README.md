# Link Prediction in PPI Networks via Chiral Quantum Walks

The link prediction problem is important for many research areas, including friendship recommendation and finding missing interactions between proteins. In this work we focused on PPI networks, which are network beased in physical or functional interaction between proteins and form a basis for network in medicine.
Our aim in this work is to efficiently predict missing links between proteins with the highest accuracy.

Many methods have been employed to attack the link prediction problem including the preferential attachment and the strctural perturbation method.
Recently a promising method based on QW has been developed by Goldsmith et al. (https://www.mdpi.com/1099-4300/25/5/730). The strategy consists in assigning a score based on the evolution of a quantum state over the network following a QW dynamic governed by the Adjacency matrix $A$.
Particularly the priorization of the edges will rely on the probability $p^i_{j}(t)$ of measuring an excitation on the node $j$ after evolving a state localized in $i$ under a unitary quantum dynamic governed by the adjacency matix $A$.

In this work we focused on characterizing the optimal evolution time for the prediction method.
Moreover we addressed the behavior of the strategy considering chirality in the evolution of the state.
