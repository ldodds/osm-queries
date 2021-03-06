/*
Having looked at nodes and ways, the final part of the OSM data model we have
to explore are relations.

Relations are collections of nodes and ways. They describe logical groupings of
objects that go beyond their basic spatial relationship. For example a relation
can be used to describe:

* a bus route, which connects a set of bus stop (nodes) and ways (the route)
* an administrative boundary
* a multipolygon, such as a collection of buildings that represent a single location

We query for relations using the `relation` keyword, or its synonym (`rel`).

We can apply filters based on tags, perform spatial queries as standard. And similar
to ways we will need to use the recursion operators (`>`, `>>`) to find their
geometries.

This query finds administrative boundaries within our bounding box.

@title 20 - Finding relations
@see https://wiki.openstreetmap.org/wiki/Relation
*/
[bbox:-25.38653, 130.99883, -25.31478, 131.08938];
relation["boundary"="administrative"];
out body;
