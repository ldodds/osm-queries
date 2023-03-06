/*
Now that we can query for both nodes and ways we can do more complex queries.

Here is an example that finds ways within our bounding box. It then uses an
`around` filter to query for nodes tagged as `amenity` that are within 100 meters
of those ways.

Remember that the `around` filter will read from the default set if a named
set is not specified. So the node query is implicitly filtering based on the results
found in the `way` query. Both queries are limited by the bounding box set for the whole query.

@title 18 - Combining node and way queries
*/
[bbox:-25.38653, 130.99883, -25.31478, 131.08938];
way;
node(around:100)["amenity"];
out body;
