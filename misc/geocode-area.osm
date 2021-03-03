/*
Finds cities and towns in Somerset

This query uses an Overpass Turbo extension called `geocodeArea`. It accepts
a search term as a parameter and attempts to match that against the name of an
area.

Areas are not present in the basic OpenStreetMap database. They're constructed
as part of loading data into the database that serves the Overpass API. So, while
they are derived from real map features they don't exist as something you can edit.

Areas are used to provide some additional functionality, such as searching for
places by name, finding features within areas, etc.

@see https://wiki.openstreetmap.org/wiki/Overpass_turbo/Extended_Overpass_Turbo_Queries
@see https://wiki.openstreetmap.org/wiki/Overpass_API/Areas
@see https://wiki.openstreetmap.org/wiki/Nominatim
@title Geocode Area
*/
[out:json][timeout:25];
{{geocodeArea:Somerset}}->.searchArea;
(
  node["place"="town"](area.searchArea);
  node["place"="city"](area.searchArea);
);
out body;
>;
out skel qt;
