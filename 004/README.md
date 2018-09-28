Touhou Discord Programmer Challenge #4 [Easy]

In mathematics and language it is common to group operations together with
parentheses. Given a string, write a function to check if all parentheses are
closed. All other parts of the string can be ignored.

Example:
```
"" => True
"Hello world!" => True
"(" => False
")" => False
"()" => True
"())" => False
"(Hello world!)" => True
"(()(()(())))" => True
"(((()()(())))" => False
```

Extra Challenge [Medium]: Generalize your solution so that all matched pairs are
closed (may have multiple types present in the same string), and enumerate all
unmatched open/close elements.
```
[], (), <>, {}, "", ''
```
Extra Challenge [Hard]: Generate all substrings encapsulated by each closed
character pair. [Very Hard]: Write this without copying portions of the string.

Use any language you like for this.

Context: Algorithms like these are commonly used as the base for parsers of all
kinds. In particular, parsers for many programming langauges utilize functions
like these for syntax validation.
