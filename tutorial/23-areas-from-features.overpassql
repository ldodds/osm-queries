/*
Sometimes we want to find the area that encloses some features of interest.
For example, finding the administrative area for a firestation. Or the park that
contains a play area.

This query demonstrates how to find the area that encloses a point using the
`is_in` statement.

The `is_in` statement allows us to find areas based on some previously found
nodes, ways or relations..

The first part of our query finds the area that contains the summit of Uluṟu:

```
node["name:pjt"="Uluṟu"]->.summit;
.summit is_in ->.someArea;
```

A named result set (`summit`) is used here to make things clearer. We first store
the node(s) we found in a variable called `summit`.

Then we use `is_in` to find which areas contain those elements. This will be ALL
the areas that cover that point. Not just the boundary of Uluṟu, but also
that of the Uluṟu-Kata Tjuṯa National Park, Petermann, the Macdonnell Region and so
on all the way up to Australia.

`is_in` returns the full spatial coverage starting from one or more features.

The Overpass API will give us the tags associated with areas, but not their geometry.

If we want that, then we need to find the original ways or relations from which
the area was created.

We do that by applying the `pivot` filter. This filter finds the corresponding OSM
database feature for an area (or areas) in our result set.

In our example query we find the `way` that corresponds to the area surrounding
the summit of Uluṟu like this:

```
way(pivot.someArea);
```

If we'd instead wanted to find a relation, then we would have used:

```
relation(pivot.someArea);
```

@title 23 - Finding the areas enclosing a feature
*/
(
  //find the node named Uluṟu. Save it in a named set called "summit"
  node["name:pjt"="Uluṟu"]->.summit;

  //for the node(s) in the named set called "summit" find the areas they are in
  //save the results in another named set called "someArea"
  .summit is_in ->.someArea;

  //TRYME 2 try commenting out these two lines and looking in the
  //"Data" tab to see just the area data
  way(pivot.someArea);
  >;
);
out body;
