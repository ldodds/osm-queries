/*
Find bronze statues, sculptures, busts and memorials and then outputs a CSV
file of the results.

@title Export bronze statues as CSV
@see https://twitter.com/ldodds/status/1056125234267471872
*/
[out:csv( ::id, ::lat, ::lon, name, artwork_type, description, artist_name, start_date, wikidata; TRUE; "|") ][timeout:60];
// gather results
(
  //find any statues, sculptures or busts made of bronze
  node["material"="bronze"][~"artwork_type"~"^statue|sculpture|bust$"];
  //also find any memorial statues made of bronze
  node["material"="bronze"]["memorial"="statue"];

);
// print results
out body;
>;
out skel qt;
