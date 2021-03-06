/*
When querying for ways we can apply everything we've learned from querying
for nodes.

That includes filtering them based on their tags. Or using them to search
nearby on the map.

The query below selects just those ways in our bounding box that have been
tagged as a tourist attraction. As the time of writing, that results in a
single way which marks out the boundary of Uluṟu.

See the query comments for other variations to try, including finding
highways, footpaths and amenities near to paths.

@title 17 - Ways and their tags
@see https://wiki.openstreetmap.org/wiki/Key:tourism
@see https://wiki.openstreetmap.org/wiki/Key:highway
@see https://wiki.openstreetmap.org/wiki/Key:foot
@see https://wiki.openstreetmap.org/wiki/Key:disused
*/
[bbox:-25.38653, 130.99883, -25.31478, 131.08938];
(
  way["tourism"="attraction"];

  //TRYME #1, ways that are tagged as highways. This includes roads and paths
  //way["highway"];

  //TRYME #2, ways that are tagged as paths
  //way["highway"="path"];

  //TRYME #3, ways that are marked as designated pedestrian access
  //way["foot"="designated"];

  //TRYME #4, ways that are tagged as disused highways
  //way["disused:highway"="path"];

  >;
);
out body;
