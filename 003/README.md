Touhou Discord Programmer Challenge #3 [Medium]

Given a weighted undirected graph `G`, and sets of nodes `A = {a1, a2, a3...}` and `B = {b1, b2, b3...}`, find the shortest path between the two node sets. Note that these node sets may not be distinct nor subgraphs.

Example:
```
Assume all edges weights are uniform (will not be uniform in practice):

a - b   c - d
    |     \
e - f - g - h
  /     |
i - j   k - l

if A = {a, e, j} and B = {d, l}, the shortest path between both sets is [e, f, g, k, l].
```

This problem has an optimal solution of O(|V| + |E|). 

Use any language you like for this.

Extra Challenge [Very Hard]: the base problem assumes there is only one traversing agent in the problem, generalize your solution so that it finds the shortest path plan for N agents starting in nodes in A and ending in B, assuming that agents cannot collide with each other. 

Context: Algorithms like these are commonly used in games and robotics to plan the paths of one or more agents to traverse the enviroment and interact with their intended targets.
