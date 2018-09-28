Touhou Discord Programmer Challenge #2 [Hard]

Assuming you have an infinite asynchronous stream of timestamped key-value
pairs, implement a localized Group-By-Key algorithm. That is: given the stream,
produce a stream of key-[values] where each group is all values with the same
key over the last X seconds of inputs.

Use any language you like for this.

Extra Challenge: design a system that can do  this across multiple machines.

```
Assuming X = 10s, format is a 3-tuple of (t, k, v):

(0, a, a)
(1, c, b)
(2, b, a)
(2, c, d)
(3, a, d)
(13, a, c)

Becomes:

(0, a, [a, d])
(1, c, [b, d])
(2, b, [a])
(13, a, [c])
```
