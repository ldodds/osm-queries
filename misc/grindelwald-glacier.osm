/*
Extract the nodes, ways and relations tagged as a glacier near the
Grindelwald Glacier in Switzerland.

@title Extract glacier features as a specific location
@see https://en.wikipedia.org/wiki/Upper_Grindelwald_Glacier
@tags glacier
*/
[out:json][timeout:25][bbox:46.5914,8.0828,46.6301, 8.1674];
// gather results
(
  // query part for: “natural=glacier”
  nwr["natural"="glacier"];
);
// print results
out body;
>;
out skel qt;
