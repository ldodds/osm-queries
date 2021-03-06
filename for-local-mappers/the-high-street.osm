/*
Finds information for a selection of buildings and amenities that you might
find on a typical UK high street.

Helpful to review whether to add details like addresses, opening hours, websites
and wheelchair access.

The query uses the "nwr" specifier to query for (n)odes, (w)ays and (r)elations. Sometimes local businesses might
only be tagged as points, in other cases the entire outline of a building might be drawn and tagged. This allows us to
find information regardless of how its represented on the map.

The query also uses a range of different filters to identify the information we're interested in. In this case a variety of
`building=*` and `amenity=*` filters. The result will be the union of all nodes, ways and relations that have these tags.

A global bounding box query filter is used to specify the
location we are interested in. The special "{{bbox}}" syntax here means
this query only works in Overpass Turbo which determines the bounding box based on your zoom level.

Alternatively you could specify a fixed bounding box: `[bbox:("...")]`
specifying the coordinates.

@title The High Street
@see https://en.wikipedia.org/wiki/High_Street
*/
[bbox:{{bbox}}];
(
  nwr["building"="retail"];
  nwr["building"="supermarket"];
  nwr["building"="commercial"];

  nwr["amenity"="pub"];
  nwr["amenity"="bar"];
  nwr["amenity"="restaurant"];
  nwr["amenity"="cafe"];
  nwr["amenity"="library"];
  nwr["amenity"="bank"];
  nwr["amenity"="fast_food"];
);
out body;
>;
out skel qt;
