Touhou Discord Programmer Challenge #6 [Medium]

Author: james7132#1567

Given a dictionary (a list of words) and a query word, find the N closest words in the dictionary to the query word. "Closeness" being defined by the LCS distance to the query word: the minimum number of edits (character insertions and deletions only, subsitutions are an insertion followed by deletion to change one string into another). Order the results from closest to farthest.

LCS: <https://en.wikipedia.org/wiki/Longest_common_subsequence_problem>

Example:
```
Dictionary: {"b", "c", "ac", "adc", "acc"}
Query: "ab"
Top N=3 results: ["b", "ac", "acc"]
```

Extra Challenge [Hard]: How would you solve this if the dictionary cannot fit in the memory of a single machine? (Can be solved using disk/file system or distributed system).

Context: Algorithms like these are commonly used as the basis for spell checkers, correction suggestion systems, and validation mechanisms for optical character recognition systems.
