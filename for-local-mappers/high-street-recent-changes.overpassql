/*
This is a variation of the query that extract information about typical high street shops and amenities.

Tt applies an additional filter to select just those nodes, ways and relations that have been changed since
the 1st January 2021.

It does this using the `newer` query filter which used to specify the full date-time of interest.

The filter cannot be applied directly to the first union, so the initial results are assigned to a variables called "`highstreet`"
and the filter is applied to that.

@title The High Street, Recent changes
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

)->.highstreet;
nwr.highstreet(newer:"2021-01-01T00:00:00Z");
out body;
>;
out skel qt;
