/*
This query selects the embankments that surround Stonehenge. It
then styles the results using MapCSS.

It demonstrates all the basic properties that can control the
display of lines.

* `color` - defines the colour of a line. Either as a named colour, or as a hex (e.g. `#000000`) or RGB value (e.g. `rgb(99,73,23)`)
* `dashes` - specifies a dashed line. use two values, the first is length of line that is drawn, the second is the length of the gap
* `opacity` - is a value between 0-1
* `width` - defines the width of the line

@title Style ways, as lines
*/
[bbox:51.17798, -1.82733, 51.17953, -1.8245];
(
  //select the ways and their nodes
  way["man_made"="embankment"];
  >;
);
out body;

//MapCSS styles
{{style:
	way { color: green; dashes: 5,8; opacity: 1; width: 5; }
}}
