# OverpassQL Syntax Reference

A concise syntax reference for [the OverpassQL language](https://wiki.openstreetmap.org/wiki/Overpass_API/Overpass_QL).

## Comments

```
//single-line comment
/* multi line comment */
```

## Escaping

* `\n` escapes a newline
* `\t` escapes a tabulation
* `\"` or `\'` escapes the respective quotation mark
* `\\` escapes the backslash
* `\u####` escapes a unicode UTF-16 value.

## Statements

Statements are terminated by a semi-colon (`;`).

A statement consist of either a _query setting_, a _keyword statement_ or a _block statement_ statement terminated by a semi-colon (`;`).

A statement might include _filters_.

Block statements and query filters might include _functions_.

## Query Setting

Must appear as the first uncommented statement in a query. Syntax is of the form:

```
[setting:value][setting2:value2][setting3:value3]...;
```
[Settings](https://wiki.openstreetmap.org/wiki/Overpass_API/Overpass_QL#Settings) include: `bbox`, `out`, `timeout`, `date`, `diff`, `adiff`, `maxsize`.

Legal values vary by setting.

## Keyword Statements

A keyword statement is a either a _query statement_ or a _simple statement_.
The keyword may optionally be preceded by the name of a set. And may be
followed by _filters_ or parameters. The optionality, number and syntax for these filters
and parameters varies by statement.

A keyword statement typically reads from and writes to a named set. Unless otherwise
specified the statement will manipulate the default set (`._`)

In general, the syntax for specifying input and output sets for a keyword statement
is:

```
.input x ->.output;
```

Where `.input` specifies the input set for a statement named `x`. And where
the assignment operator (`->`) is used to name the output set (`.output`).

However query statements use an alternate syntax for defining their input set.

### Query statements

These statements read from the OSM database by default, rather than a named
set. Their output can be assigned to a named set, or are added to the default
set if not specified.

| Query Statement | Description |
|-----------|-------------|
|`node`|Find nodes
|`way`|Find ways
|`rel`|Find relations
|`nwr`|Find nodes, ways, or relations
|`nw`|Find nodes or ways
|`nr`|Find nodes or relations
|`wr`|Find ways or relations
|`area`|Find areas
|`<`|Recurse up
|`<<`|Recurse up relations
|`>`|Recurse down
|`>>`|Recurse down relations

While the recursion operators use the standard _keyword statement_ syntax for
defining input and output sets, the _query statements_ for finding nodes, ways,
relations and areas use a different syntax.

For example:

```
node.input ->.output;
```

Where `.input` specifies the set against which the `node` statement will
execute (applying any filters). And results are added to a set called `.output`.

**Note**: this syntax is described as a filter in the OverpassQL language reference,
but is arguably better considered as specifing the input to the query.

### Simple statements

Other statements only manipulate sets:

| Simple Statement | Description |
|-----------|-------------|
|`out`|Output the contents of a set. Required to get any output at all|
|`.x;`|Reference to contents of the named set `.x`. Used in set arithmetic
|`is_in`|Find areas that cover a lat/lng or nodes in a named set
|`timeline`|Lookup version history of an object
|`local`|Convert input into representation of OSM data
|`convert`|Creates elements from its input set, adding or filters tags
|`make`|Make a new element, e.g. a node, way or relation, or arbitrary object holding name-value pairs
|`derived`|Query for derived objects?

## Block Statements

Block statements are one of the following.

|Statement|Syntax|Description|
|---------|------|-----------|
|Union|`(statement1; statement2; ...)`|Set union of the results of one or more statements|
|Difference|`(statement1; - statement2;)`|Set difference between two statements|
|If|`if (...evaluator...) { ... } else { ... }`|If statement, with optional else. See _evaluator_
|For Each|`foreach { ... }`|Performs block for each statement of its input set
|For|`for (...evaluator...) { ... } `|Perform block of statements for each subset returned by its _evaluator_.
|Complete|`complete {...}`|Loop repeatedly until results of substatements no longer change.
|Retro|`retro (...evaluator...) {...}`|Perform block for dates specified by _evaluator_
|Compare|`compare (...evaluator...) {...}`|Compare diff of two timestamps. Evaluator and statement block are optional

**Note**: there is no Intersection block statement. The closest is to use a _query statement_ of
the form: `node.set1.set2`

The If and Retro statements do not read or write to sets. (Or this remains
undocumented if so).

The Union, Difference, For Each, For and Complete and Compare block statements
write to the default set, unless a named set is specified via the `->` operator.
But the syntax varies:

* Union and Difference use the basic syntax, e.g. `(...)->.output;`
* For the others, which have blocks (`{}`), the `->` operator is appended to the keyword

E.g. to direct the output of a For Each statement use:

```
foreach->.output {statements}
```

The For Each, For, Complete and Compare block statements all read values from the
default set, unless a named set is specified instead.

* The Compare statement uses the default _keyword statement_ syntax, e.g: `.input compare()->.output;`
* Whereas the others use a dotted syntax similar to _query statements_

E.g. to specify that a For Each statement reads from `.input` and writes to `.output`
use this syntax:

```
foreach.input->output { ... }
```

Within a `for` loop, the current value of the loop is assigned to a variable
called `val` which is attached to the output set.

For example with a `for` loop reading from `.input` and writing to `.output` within the block the
value of `.output.val` is the current value of the evaluator.

```
for.input->output { ... .output.val is available here ... }
```

##Filters

Filters can be applied to _query statements_ to limit the query results in various
ways.

### Tag Filters

Tag filters are applied to the tags (name-value pairs) associated with the objects being queried.

The use square brackets (`[]`). Names, values and regular expressions can optionally be
wrapped in double or single quotes. Quotes must be used if there is a space in the value.

|Filter|Description|
|------|-----------|
|`["name"]`|The `name` tag must be present on the object
|`[!"name"]`|The `name` tag must not be present
|`["name"="value"]`|The `name` tag must have the value `value`
|`["name"!="value"]`|The `name` tag must not have the value `value`
|`["name"~"regex"]`|The value of the `name` tag must match `regex`
|`["name"~"regex", i]`|As above, but case insensitive.
|`["name"~"^$"]`|The `name` tag has no value. Regex to match empty string. Only way to test for empty values.
|`[~"name-regex"~"value-regex"]`|Apply the `value-regex` to any tag that matches `name-regex`
|`[~"name-regex"~"value-regex", i]`|As above, but case insensitive

[POSIX Extended](https://en.wikipedia.org/wiki/Regular_expression#POSIX_basic_and_extended) regular
expressions are supported. Use the `^` and `$` symbols to match start and end of strings. `|` to
specify alternatives, etc.

### Identity Filter

Uses `()` brackets.

Limit results to the objects that have a specified id, e.g. `node(1)`

Limit results to one or more objects: `node(id:1, 2, 3)`

The second is more efficient than multiple individual identity filters for the same
object type.

### Spatial Filters

Spatial filters use rounded brackets (`()`). The following spatial filters are
supported.

|Filter|Syntax|Description|
|------|------|-----------|
|Bounding Box|`(south, west, north, east)`|Filter based on bounding box specified by four coordinates
|Around|`(around:radius,lat,lng)`|Filter to objects within circle defined by centroid `lat`, `lng` and `radius`
|Around|`(around.input:radius)`|Filter to objects that are within `radius` distance of objects in `.input` set
|Around|`(around:radius,lat1,lng1,lat2,lng2,...,latn,lngn)`|Filter to objects with `radius` distance of a linestring
|Polygon|`(poly:"lat1 lng1 lat2 lng2 ... latn lngn")`|Filter to objects within a polygon

### Area Filters

Filters objects to those that are spatially contained within an area.

This is different to _member filters_ that look at parent-child relationships within the OSM data model.

Also note that the `area` filter is different to the `area` _query statement_. The latter queries for
areas, to fetch them from the database. Whereas the former is used to do a spatial filter on a result set.

The `area` filter uses rounded brackets (`()`).

|Syntax|Description|
|------|-----------|
|`(area)`|Filter based on whether objects are within areas in the default set
|`(area.input)`|Filter based on whether objects are within an area stored in the named set (`.input`)
|`(area:nnnnnnn)`|Filter to objects contained within a specific area, identified by is database id

The `pivot` filter is related to the `area` filter. It is used to select the OSM database
object that corresponds to the area(s) contained in a result set:

```
way(pivot)       //find ways that correspond to areas in the default set
way(pivot.input) //find ways that correspond to areas in set called 'input'
```

### Date Filters

Date filters use rounded brackets (`()`).

|Filter|Syntax|Description|
|------|------|-----------|
|Newer|`(newer:"YYYY-mm-ddTHH:MM:ssZ")`|Filter to objects that have changed since specified date-time
|Changed|`(changed:"YYYY-mm-ddTHH:MM:ssZ")`|Filter to objects that have changed between date-time and current time
|Changed|`(changed:"YYYY-mm-ddTHH:MM:ssZ","YYYY-mm-ddTHH:MM:ssZ")`|Filter to objects that have changed between two dates

### Member (Recursion) Filters

The recursion filters use rounded brackets (`()`).

In the OSM data model. Nodes can be children of ways and relations. Ways can be children
of relations. Relations can be children of other relations. These relationships can be
qualifed by a role.

The member filters allow traversal between parent and child objects via these relationships.

They are used to select objects of different types, based on whether they are members of
the objects in their input set.

The input set is the default set (`._`) unless specified by dotted syntax. For example to
find nodes in the OSM database that are members of ways found in a set called `.input`:

```
node(w.input);
```

|Name|Filter|Example|Description|
|----|------|-------|-----------|
|Members of ways|`(w)`|`node(w)`|Select child nodes of ways from input set
|Members of relations|`(r)`|`node(r)`|Select node members of relations in input set
|Members of relations|`(r)`|`way(r)`|Select way members of relations in input set
|Parents of nodes|`(bn)`|`way(bn)`|Select parent ways from nodes in input set
|Parents of nodes|`(bn)`|`rel(bn)`|Select parent relations of nodes in input set
|Parents of ways|`(bw)`|`rel(bw)`|Select parent relations of ways in input set
|Parents of relations|`(br)`|`rel(br)`|Select parent relations of relations in input set

The filters can be further qualified by role:

```
r:"x" //members of relations via a role called 'x'
r:""  //members of relations with empty role
r.input:"x" //members of relations in a set called input, with role 'x'
r.input:"" //members of relations in a set called input, with empty role
```

### User Filter

Filter objects by the user associated with most recent change.

|Filter|Syntax|Description|
|------|------|-----------|
|User|`(user:"name")`|Filter objects last touched by user name `name`
|User|`(uid:id)`|Filter objects last touched by user id `id`

### Conditional Filter

Filter objects based on a custom expression. Objects for which the expression
does not return true will be filtered from the results.

```
(if: expression)
```

Where expression is an _evaluator_ that returns a boolean value.

## Expressions (Evaluators)

Expressions consist of _functions_ and operators.

### Operators

|Operator|Description|
|--------|-----------|
|`!`, `||`, `&&`|Boolean logic
|`-`, `+`, `/`, `*`|Mathematical operators
|`==`, `!=`|Equality operators
|`<`, `<=`, `>`, `>=`|Comparisons
|`expr ? x : y`|Ternary operator

## Functions

|Function|Description|
|--------|-----------|
|`angle()`|Calculates angle between two segments in a way
|`center(...)`|Calculates centre of the bounding box of its input
|`changeset()`|Returns the id of the changeset for last update to an object
|`count(...)`|Count objects of the type specified in its parameter, which will be one of `nodes`, `ways`, `relations`, `deriveds`, `nwr`, `nw`, `wr`, `nr`
|`count_by_role()`|Count number of members with a specific role
|`count_distinct_members()`|Count number of distinct members
|`count_distinct_by_role()`|Count number of distinct members with a specific role
|`count_members()`|Count number of members for an object
|`count_tags()`|Count tags for an object
|`date(...)`|Turns its argument into a number representing a date, for comparison purposes only
|`gcat(...)`|Calculate combined geometry from its input set
|`geom()`|Returns geometry of an object
|`hull(...)`|Returns the convex hull of its argument
|`id()`|Returns OSM id of an object
|`is_closed()`|Returns 1 if a way is closed, 0 others. Closed means the first and last node are the same.
|`is_date(...)`|Tests whether its argument represents a date
|`is_number(...)`|Returns 1/0 depending on which its argument is a number
|`is_tag("name")`|Return 1 if an object has a tag called `name`. Otherwise 0.
|`keys()`|Returns keys for a given object
|`lat()`|Latitude of an object (or its bounding box centroid)
|`length()`|Returns length of an object. Will be length of a way or all ways in a relation
|`lon()`|Longitude of an object (or its bounding box centroid)
|`lrs_in(...,...)`|Returns 1 if its first argument is contained in the set provided as a second argument
|`lrs_isect(...,...)`|Returns the intersection of its two arguments, treated as sets
|`lrs_min(...)`|Returns the minimum of the elements in its argument
|`lrs_max(...)`|Returns the maximum of the elements in its argument
|`lrs_union(...,...)`|Returns the union of its two arguments, treated as sets
|`lstr(..,..)`|Returns linestring constructed from its arguments
|`min(...)`|Returns minimum value in the set provided as a parameter
|`max(...)`|Returns maximum value in the set provided as a parameter
|`number(...)`|Convers argument to a number, or "NaN"
|`per_member(...)`|Executes its argument once per member of the element
|`per_vertex(...)`|Executes its argument once per vertex of the element
|`poly(..,..)`|Returns a polygon constructed from its arguments
|`pos()`|Position for a member within an element
|`pt(lat,lng)`|Returns a valid OSM node geometry for given location
|`set(...)`|Returns semi-colon list of all distinct values in its input
|`suffix(...)`|Returns any value following a number in its input
|`sum(...)`|Sums values in set provided as parameter
|`timestamp()`|Returns timestamp of an object
|`trace(...)`|Returns the trace of its argument?
|`type()`|Returns type of an object. E.g. node or way
|`t["name"]`|Returns value of the `name` tag
|`u(...)`|???
|`uid()`|Returns user id of the user who last edited an object
|`user()`|Returns user name of last editor of an object
|`version()`|Returns version number of an object

## Overpass Turbo Extensions

Overpass Turbo defines some extensions. These are like macros which are executed
by the IDE and replaced with an appropriate value or statement.

|Shortcut|Description|
|--------|-----------|
|`{{bbox}}`|Calculate a bounding box based on current map view|
|`{{center}}`|Calculate center coordinates of current map view|
|`{{date}}`|Current date and time
|`{{date:specifier}}`|Create historical date based on `specifier`.Syntax is a number followed by a time period: second, minute, hour, days, weeks, months, years. E.g. `1 day`, `2 years`
|`{{geocodeId:"query"}}`|Perform Nominatim search using `query`. Use OSM id of first result
|`{{geocodeArea:"query"}}`|Perform Nominatim search using `query` for an area. Use OSM id of first area
|`{{geocodeBbox:"query"}}`|Perform Nominatim search using `query`. Use the bounding box of the first result
|`{{geocodeCoords:"query"}}`|Perform Nominatim search using `query`. Use the centroid of the first result
|`{{style:...}}`|Define MapCSS styles to be applied to query results
|`{{data:overpass,server=...}}`|Specify URL of Overpass API endpoint

Custom macros can also be defined. Specify `{{shortcut=value}}` and all occurences of
`{{shortcut}}` in the query will be replaced by `value`.
