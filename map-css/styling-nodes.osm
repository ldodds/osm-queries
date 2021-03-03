/*
This query selects shops and amenities within the Colosseum in Rome.

The query selects any node with either the shop or amenity tag. The
MapCSS then styles the nodes based on their tags and values. This highlights
that the interpreter has access to all of the data about a map feature.

The styling does the following:

* provides a fallback to style any unexpected nodes as red
* styles drinking water fountains as blue circles
* styles shops as black circles with a green fill
* styles toilets by displaying an (oversized!) icon

For icons, Overpass Turbo has three sets available. See the links below.

Note, the ordering of the styles is important. They're applied in order. so
if we'd put the fallback style (the red circle) at the end then that's all we'd
see. You can try it.

If you're wondering. Its a wastebin.

@title Styling nodes
@see https://wiki.openstreetmap.org/wiki/Overpass_turbo/MapCSS
@see https://github.com/tyrasd/overpass-turbo/tree/master/icons
*/
[bbox:41.88926, 12.49109, 41.8911, 12.49392];
(
  node["shop"];
  node["amenity"];
);
out body;

//MapCSS styles
{{style:
  node { fill-color: red; color: red; fill-opacity: 1;}
  node[amenity=drinking_water] { fill-color: blue; color: blue, fill-opacity 1;}
  node[shop] { fill-color: green; fill-opacity 1; color: black }
  node[amenity=toilets] { icon-image: url("icons/maki/toilets-24.png"); icon-width: 50;}
}}
