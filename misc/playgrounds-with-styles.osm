/*
 @title Find playgrounds, add styling
 */
[out:json][timeout:25];
// gather results
(
  // query part for: “leisure=playground and access!=no and access!=private”
  node["leisure"="playground"]["access"!="no"]["access"!="private"]({{bbox}});
  way["leisure"="playground"]["access"!="no"]["access"!="private"]({{bbox}});
  relation["leisure"="playground"]["access"!="no"]["access"!="private"]({{bbox}});
);
// print results
out body;
>;
out skel qt;

{{style:
way{
  color: green;
  fill-color: green;
  text: name:en;
}
node{
  color: green;
  fill-color: green;
  text: name:en;
}
relation{
  color: navy;
  fill-color: green;
  text: name:en;
}
relation node, relation way, relation relation {
  color: green;
  fill-color: green;
}
}}
