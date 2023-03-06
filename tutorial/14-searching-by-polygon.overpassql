/*
OverpassQL supports searching for features within a polygon defined by a collection of
points.

The `poly` filter accepts a single parameter. This must be a string value that
contains an even number of latitude and longitude pairs. Collectively these
coordinates should define a closed shape on the map.

This polygon is then used as the boundary for the query.

This query extracts nodes that can be found within a polygon that covers
an area to the west of Uluṟu.

There isn't a default bounding box defined in this query, as our area of
interest is fully described by the `poly` filter.

Note there's some quirks around syntax here which make `poly` slightly different to
`around`:

* the parameter MUST be provided as a quoted string.
* the coordinate values MUST be separated by spaces and not commas.

The syntax for the `around` filter is different.

Unfortunately, unlike `around`, the `poly` filter doesn't support querying based
on a polygon that was found by a previously extracted set of nodes.

So you can't, for example, extract the polygon describing a closed way
stored in OpenStreetMap and then search within it. This feels like an oversight, but
we'll see how to do this type of query later in the tutorial.

**Tip**: the more complex your polygon, the slower the search. Simplify the boundary
to improve performance.

@title 14 - Searching by polygon
*/
node(poly:"-25.336204100149033 131.0238147136019 -25.341828144950995 131.02072480881674 -25.341944501738343 131.02754834855062");
out body;
