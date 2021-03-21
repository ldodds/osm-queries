/*
This query demonstrates how to filter nodes based on their tags.

This is a useful and important feature. You'll be using it a lot in your queries.

Tags in OpenStreetMap are used to attach information to nodes, ways and
relations. There is an ever growing list of tags used to capture different
types of data.

Often, when we're querying the database we're not interested in all of
the nodes (or ways or relations) in an area. Just those tagged as a specific type.

We can specify filters in our Overpass QL queries to restrict the results to
just those features that have specific tags and values.

Tag filters as defined within square brackets (`[]`). This query adds a filter to
the `node` statement:

```
node["name"]
```

This limits the set of returned nodes to those that have a `name` tag, regardless
of its value.

As we saw in the previous example, many nodes in the OpenStreetMap data are
there to help define larger geospatial features. They aren't all individually
points of interest. So they don't typically have any tags attached to them.

When you run this query you'll see that there are now only around 30 nodes returned
compared to the 4,000 or so returned in the previous examples.

OpenStreetMap is a multilingual map. And some tags, like names, might have
values in several different languages.

The OSM data model doesn't allow tags to have multiple values, e.g. one per language.
Instead we use multiple tags, which are qualified by a language code.

For example, if we wanted to find nodes that have a name in Pitjantjatjara, which is
the dialect spoken by the people that live around Uluṟu, then we would instead
filter for a tag called `name:pjt`.

Who gets to decide what goes in the default `name` tag? That's something for
local mappers to discuss and agree on. See the links below for more information.

@title 03 - Filtering nodes that have a tag

@see https://wiki.openstreetmap.org/wiki/Key:name
@see https://wiki.openstreetmap.org/wiki/Multilingual_names
@see https://en.wikipedia.org/wiki/Pitjantjatjara
@see https://en.wikipedia.org/wiki/Pitjantjatjara_dialect
*/
//find all the nodes in this box around Uluṟu
[bbox:-25.38653, 130.99883, -25.31478, 131.08938];

//but limit to just those nodes that have a name tag
node["name"];

//TRYME #1 the above two statements are equivalent to the following.
//use this form if you need to query for features in several
//different bounding boxes
//node(-25.38653, 130.99883, -25.31478, 131.08938)["name"];

//TRYME #2 try finding just nodes that have a Pitjantjatjara name
//node["name:pjt"];

//use out body to include tags in the output, so
//we can inspect the results
out body;
