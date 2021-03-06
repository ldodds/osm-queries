/*
@title Find playgrounds
*/
[out:json][timeout:25];
// gather results
(
  // query part for: “leisure=playground and access!=no and access!=private”
  nwr["leisure"="playground"]["access"!="no"]["access"!="private"]({{bbox}});
);
// print results
out body;
>;
out skel qt;
