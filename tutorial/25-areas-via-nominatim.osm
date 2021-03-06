/*
This query shows another way to search for areas to help filter queries.

The Overpass Turbo IDE provides several [extensions](../syntax-reference.html#overpass-turbo-extensions) to the core OverpassQL language.

We met one of those much earlier in the tutorial. We used `{{bbox}}` to
automatically define a bounding box based on the current view of the map in the IDE.

Another useful extension is `geocodeArea`, which is demonstrated in this query.

The extension accepts a search parameter which is used to do a free-text
search using the Nominatim API to find the first matching area.

This can be a more flexible way to match areas. Otherwise we are limited to doing
matching of tag values using regular expressions.

Just remember this is an Overpass Turbo only feature. If you want to achieve a similar
effect in an application you'll need to query both APIs.

@see https://wiki.openstreetmap.org/wiki/Nominatim
@title 25 - Areas via Nominatim search
*/
{{geocodeArea:"Uluṟu-Kata Tjuta National Park"}}->.searchArea;
(
 //find all nodes tagged as caves within the area we found
 node["natural"="cave_entrance"](area.searchArea);
);
out body;
