/*
The previous example demonstrated how to create a union from multiple
`node` queries.

The sets of results returned by each query statement are merged to produce
the output.

We can also calculate the difference between two sets of results.

We do this by using the minus operator. The general syntax is:

```
( statement1; - statement2; )
```

The result will be those nodes (or ways or relations) returned by
`statement1` that weren't returned by `statement2`.

This query finds all nodes that are tagged as tourist areas and are not also
tagged as caves.

We can achieve the same thing using a simple tag filter, but this helps to
illustrate the basic syntax.

@title 07 - Calculating differences between results
*/
[bbox:-25.38653, 130.99883, -25.31478, 131.08938];
(
node["tourism"];
-
node["natural"="cave_entrance"];
);
out body;
