/*
OpenBenches is a project to crowd-source inscriptions of benches
around the world. All of the data is openly licensed.

Data from OSM can be used to help with surveying benches to add to
OpenBenches. And bench locations in OpenBenches could be used to help improve OSM as they're alway based on a local survey. Users are asked to submit a photo of the bench and/or its inscription.

This query is intended to help anyone interested in improving the quality of bench coverage in either service.

Benches with backrests might well have an inscription.

Benches with inscriptions could be added to OpenBenches

Benches that have been added to OpenBenches could have the id tagged.

This report tries to summarise how well benches are tagged and the two services linked based on the current map view.

Benches with an `inscription`, or an `inscription:url` tag and
an `openbenches:id` are shown as green circles. These are complete.

Benches with a green circle, but a white fill have an OpenBenches id but no `inscription` or `inscription:url` tag. Data is missing in OSM.

Benches with an `inscription` tag but no `openbenches:id` are shown as orange circles. They could be surveyed and added to OpenBenches

Benches with an orange circle and a yellow fill have a backrest, but don't have an `inscription` or `inscription:url` tag. There may be missing information in OSM that could be added if they were resurveyed. And they could be added to OpenBenches too.

Benches with a grey circle and a white fill have no tags relating to backrests, inscriptions, etc. Tags might be missing. They could be checked so that `backrest=no` could be added.

Benches that are in OpenBenches but are not in OSM are not shown :)

Hopefully this might be useful as a small project?


@title Mapping bench inscriptions
@see https://wiki.openstreetmap.org/wiki/Key:openbenches:id
@see https://wiki.openstreetmap.org/wiki/Tag:amenity%3Dbench
*/
[bbox:{{bbox}}];
(
  node["amenity"="bench"];
);
out body;

{{style:

  node[amenity=bench]
  { color: grey; fill-color: white; fill-opacity: 1; opacity: 1}

  node[amenity=bench][backrest=yes][!inscription]
  { color: orange; fill-color: yellow; }

  node[amenity=bench][backrest=yes][!inscription:url]
  { color: orange; fill-color: yellow; }

  node[amenity=bench][inscription][!openbenches:id]
  { color: orange; fill-color: orange; }

  node[amenity=bench][openbenches:id][!inscription]
  { color: green; fill-color: white; }

  node[amenity=bench][openbenches:id][!inscription:url]
  { color: green; fill-color: white; }

  node[amenity=bench][openbenches:id][inscription]
  { color: green; fill-color: green; }

  node[amenity=bench][openbenches:id][inscription:url]
  { color: green; fill-color: green; }

}}
