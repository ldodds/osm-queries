# Background

The OpenStreetmap project provides an API that can be used to query and
extract data in a variety of formats.

The [Overpass API](https://wiki.openstreetmap.org/wiki/Overpass_API#Public_Overpass_API_instances) is
a completely public API and can be freely used without registration.

The API uses a custom query language called [Overpass QL](https://wiki.openstreetmap.org/wiki/Overpass_API/Overpass_QL)
that can be used to construct some very powerful and flexible queries.

These are frequently written and executed via a web based API called [Overpass
Turbo](https://wiki.openstreetmap.org/wiki/Overpass_turbo) which provides a
wizard to support creation of queries, as well as some additional functionality.
This includes providing the ability to save queries in your browser and view
styled results on an embedded map.

Like any powerful query language, Overpass QL has a lot of features. It also
has syntax shortcuts that allow the same query to be expressed in different ways.

It's really a mini programming language that has been designed to interact with
the OpenStreetmap data model. This also means it doesn't really look like other
query languages you may have used like SQL, GraphQL or SPARQL.

This flexibility, complexity, and the variety of ways in which data can be
tagged in OpenStreetmap, can make Overpass QL a bit daunting to learn and tricky to
use to get exactly the data you want.

However it is a very powerful language and is well suited to quick interactive
explorations of OpenStreetmap data, as well as performing small exports in a variety
of languages.

This website provides a range of example queries that are intended to help
people to learn the language whilst showcasing its functionality.

It's intended to build on and complement a number of other resources, including:

* [The Overpass Language Guide](https://wiki.openstreetmap.org/wiki/Overpass_API/Language_Guide) which provides a
detailed overview of the language syntax and functionality
* The [Overpass API by example](https://wiki.openstreetmap.org/wiki/Overpass_API/Overpass_API_by_Example) page on the OSM wiki which includes a range of examples
* And the [Overpass API user's manual](https://dev.overpass-api.de/overpass-doc/en/) which is still a work in progress

Use these as additional references.
