Touhou Discord @Programmer Challenge #5 [Medium]

Author: @LordAlfredo#6174

Write a key-value data structure that supports "auto-expiring" data - namely, any data inserted should be automatically removed after a preconfigured expiration. Should support multiple values per key: Calling `get(key)` should enumerate all values for that key valid at the current timestamp.

Example:
```
Configured expiration: 60s
Insertions at 
0s: (A, 5)
15s: (B, 3)
30s: (A, 10)
45s: (C, 6)
60s: (A, 2)

Calling get(key) results in:
1s: A: [5], B: [], C: []
31s: A: [5, 10], B: [3], C: []
65s: A: [10, 2], B: [3], C: [6]
76s: A: [10, 2], B: [], C: [6]
```

Bonus 1 [Medium]: Alter the data structure to support multi-level keys (eg, (A, a), (A, b), (B, a)). Retrieving a top level key (e.g. retrieving A while (A, a) is present) should also enumerate all values for sub-keys.  To avoid memory exhaustion, make sure any key (at any level) is removed if it has no values.
Bonus 2: [Hard]: Make this structure thread-safe on insertion, retrieval, and expiration/removal.
Bonus 3: [Very Hard] Make Bonus 1 thread-safe such that I can run parallel inserts on (A, a), (A, b) (but obviously getting A should block both).  This includes key cleanup.
