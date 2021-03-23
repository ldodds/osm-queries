/*
The `around` filter can be used to find features that are near to a previously
extracted set of results.

This, more powerful, use of the filter is illustrated in this query.

The query does two things.

Firstly it searches within the bounding box to find all nodes that are
tagged as peaks. These nodes will be automatically stored in the default set ("`_`").

The second part of the query then filters to just those nodes that are tagged as
caves AND are within 850m of one of the previously found results.

In this case there is only a single peak within our bounding box (the summit of
Uluṟu), so the query returns just those caves that are within 850m.

If the `around` filter isn't provided with coordinates, or a set of coordinates,
then it uses the default set ("`_`") as the basis for its search.

As with other query statements, you can also specify the set to use. The comments
in the query indicate an alternative way to achieve the same result but using named sets.

My suggestion is to always used named sets to make your queries more readable.

This way of using `around` is much more powerful than specifying a fixed radius
or line. We can instead do more complex queries such as finding amenities that
are near to bus stops or a road.

When experimenting with this query try using the `out count` variation. This
produces a count of the nodes, rather than their coordinates and tags. Useful
if you just want to do some quick analysis or collect some figures.

**Tip**: If you try `out count`, Overpass Turbo may warn you that there are
no results it can display on the map. Just look at the data tab instead.

@title 13 - Using around to filter against a set of results
*/
[bbox:-25.38653, 130.99883, -25.31478, 131.08938];
node["natural"="peak"];
node(around:850.00)["natural"="cave_entrance"];

//TRYME #1 this produces the same output, but shows how to
//make around use a named set of results, instead of the default set
//node["natural"="peak"]->.peaks;
//node(around.peaks:850.00)["natural"="cave_entrance"];

out body;

//TRYME #2. Try producing a count of the results instead of a list of nodes
//out count;
