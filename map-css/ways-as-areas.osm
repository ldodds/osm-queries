/*
This query selects the unnamed standing stones at Stonehenge. It
then styles the results using MapCSS.

It demonstrates all the basic properties that can control the
fill of a shape

* `fill-color` - defines the colour of the fill. Either as a named colour, or as a hex (e.g. `#000000`) or RGB value (e.g. `rgb(99,73,23)`)
* `fill-opacity` - is a value between 0-1

You'll notice that Overpass Turbo will apply its default styles to the shapes
so there will be a different colour outline to the stones.

Try adjusting the query to use this instead:

```
way { color: brown; fill-color: brown; opacity: 1; fill-opacity: 1 }
```

@title Style ways, as areas
*/
[bbox:51.17798, -1.82733, 51.17953, -1.8245];
(
  //select the ways and their nodes
  way[!"name"]["historic"="stone"];
  >;
);
out body;

//MapCSS styles
{{style:
  way { fill-color: brown;  fill-opacity: 1 }
}}
