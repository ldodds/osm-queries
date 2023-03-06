/*
OverpassQL can also be used to generate simple CSV exports.

This is achieved by using the `[out:csv]` query setting.

In order for the API to know how to construct the CSV output you must provide
a specification of what fields (columns) to include. These fields are either:

* a special field name, which is predefined by the API, e.g. `::id`
* or the name of a tag

The special field names include:

* `::id` - the database id of the object
* `::type` - its type, e.g. node, way or relation
* `::lat` - its latitude
* `::lon` - its longitude

The list of columns to include in the output are specified as parameters in the query setting
statement.

Other parameters allow you to customise whether a header line is included in the CSV file and
choose the column separator. The defaults are to include a header and produce a tab delimited
file.

The general syntax for the `out:csv` setting is:

```
[out:csv (columns; header; col-separator)]
```

Where:

* `columns` is a comma separated list of names
* `header` is either `true` or `false`
* `col-separator` is the desired separator provided as a string.

This query generates a simple comma-separated table containing the `id`, coordinates
and names of caves within the bounding box. But some other variations are also provided for
you to try out.

If you want to include tags in your CSV output, then the `out` keyword of your
query **must** generate tags. So use `out body` or `out meta`.

Also note that when you're including latitude (`::lat`) and longitude (`::lon`)
columns then for nodes you'll get their original coordinates. But ways and relations are
more complex spatial objects. They aren't defined by a single point.

You can use the `out` keyword to automatically generate a representative location (a "centroid")
for those types of feature. Specifying `out body center` will do the trick. This will calculate
a centroid for any way or relation in your results.

**Tip**: when generating CSV output, if there is a query error or timeout then you will
get empty results. I'd recommend writing and testing your basic query first so you're
sure it's working. And then customise it further to generate the desired CSV output.

@title 09 - Generating CSV output
@see https://wiki.openstreetmap.org/wiki/Overpass_API/Overpass_QL#CSV_output_mode
*/
//Comma separated table of id, coordinates and names
[out:csv(::id, ::lat, ::lon, name; true; ",")];

//TRYME #1 include node type
//[out:csv(::id, ::lat, ::lon, ::type, name; true; ",")];

//TRYME #1 pipe delimited, no header
//[out:csv(::id, ::lat, ::lon, ::type, name; false; "|")];

//find nodes tagged as caves
node(-25.38653, 130.99883, -25.31478, 131.08938)["natural"="cave_entrance"];

//include tags in output, so we can have them in our CSV output
out body;
