/*
 @title Extract all data within the bounding box
*/
[out:json][timeout:25];
(
  node({{bbox}});
  way({{bbox}});
  relation({{bbox}});
);
out body;
>;
out skel qt;
