/*
This query finds all natural rock formations within Uluṟu-Kata Tjuta National Park.

The results include Uluṟu, Kata Tjuta, Taputji and Mala Kata.

Kata Tjuta is a more complex rock formation and is represented as a relation in
the OSM database. So if we had used only a `way` query then it wouldn't be present
in the results. The `wr` query lets us do a type agostic query to find the areas
of interest.

So far we've written queries to find nodes, ways and relations. But in this query
we are using a new statement: `area`.

Areas are interesting in that they are not formally part of the OSM data model.
They are features which have been automatically added to the databases that power the Overpass API. This means that
they can be queried and manipulated via the API, but they're not something you can edit.

Areas are automatically created for a range of different types of ways and relations, including:

* any relation with a `type` of `multipolygon` and a `name`
* any relation with a `type` of `boundary` and a `name`
* any relation that has an `admin_level` and `name` attribute
* any relation with a `postal_code` or `addr:postcode`
* a wide range of different named ways including buildings, highways, natural features, leisure areas, places, historic and tourism areas

The complete list is evolving over time.

Areas then are a set of features that are derived from a subset of the ways and
relations that exist in the wider database.

From a query perspective, you can think of them like other elements and find them
using the standard range of filters.

For example  in this query we're finding an area based on its name.

```
area["name"="Uluru-Kata Tjuta National Park"]
```

The advantage of using areas rather the original ways and relations is that the API and
query language provides some additional functionality for working with them.

For example in this query we're using an `area` filter, like this:

```
way(area);
```

The `area` filter restricts the ways (or nodes, or relations) we're interested in
to just those that within an area we've already found. This type of spatial query
isn't normally available for ways and relations. I presume this is to limit the amount
of indexing required to support this type of query.

The `area` query and the `area` filter both work with named sets. By default they work
with the default set (`_`). And this is what the example query uses.

But an alternate way to write this example is to explicitly store the area we're
interested in a named set. I find this a bit clearer in practice.

Here's how this would look, using a named set called `ourArea`:

```
area["name"="Uluru-Kata Tjuta National Park"]->.ourArea;
(
 way(area.ourArea)["natural"="bare_rock"];
 >;
);
```

If we wanted to instead find nodes or relations then we could use either of the
following:

```
node(area.ourArea);
relation(area.ourArea);
```

@see https://wiki.openstreetmap.org/wiki/Overpass_API/Areas
@see https://github.com/drolbr/Overpass-API/blob/master/src/rules/areas.osm3s
@see https://en.wikipedia.org/wiki/Kata_Tjuta
@see http://www.indigenousaustralia.info/the-dreaming/rock-legends/taputji.html
@title 22 - Areas
*/
//find any area with this name
area["name"="Uluru-Kata Tjuta National Park"];
(
 //find any ways and relations that are WITHIN that area, filtering them by their tag
 wr(area)["natural"="bare_rock"];
 >;
);
out body;
