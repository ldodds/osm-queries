/*
This is Brøndby Haveby near Copenhagen. I just thought they looked a bit like flowers.

This demonstrates building up a more complex query to select and then style
a collection of nodes, ways and relations.

@title Brøndby Haveby
@see https://www.lonelyplanet.com/articles/broendby-haveby-denmark-from-above
*/
[bbox:55.6342, 12.39277, 55.63981, 12.40409];
(
  way["highway"="living_street"]["name"~"^Lille|Store"];
  >;
  way["highway"="residential"]["name"="Store Harekærvej"];
  >;
  node["addr:street"~"^Lille|Store"];
  >;
  way["amenity"="parking"];
  >;
  relation(6323434);
  >;
);
out body;

{{style:

way[highway] { color: #654321; opacity: 1; }
way[amenity=parking] { fill-color: yellow; fill-opacity: 1; color: yellow;}
way[role=inner] { fill-color: green; width: 0; }
relation { opacity: 0; fill-color: green; fill-opacity: 1; }
way[barrier=hedge] { opacity: 0; }
node{ color:red; opacity: 1; fill-color: red; fill-opacity: 1;}
node[highway] { fill-color: orange; opacity: 0; }
node[@id=3728284045] { opacity: 0; fill-opacity: 0;}
}}
