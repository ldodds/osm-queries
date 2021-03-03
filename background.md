# Background

The [Overpass API](https://wiki.openstreetmap.org/wiki/Overpass_API#Public_Overpass_API_instances) is a
completely public API and can be freely used without registration.

The API uses a custom query language called [Overpass QL](https://wiki.openstreetmap.org/wiki/Overpass_API/Overpass_QL)
that can be used to construct some very powerful and flexible queries.

These are frequently written and executed via a web based API called [Overpass
Turbo](https://wiki.openstreetmap.org/wiki/Overpass_turbo) which provides a wizard to support
creation of queries, as well as some additional functionality. This includes providing the ability to save queries in your browser and view
styled results on an embedded map.

Like any powerful query language, Overpass QL has a lot of features. It also has syntax shortcuts that allow
the same query to be expressed in different ways.

It's really a simple programming language that has been designed to interact with
the OpenStreetmap data model. This means it doesn't look like other query languages you may have used like SQL, GraphQL or SPARQL.

This flexibility, complexity, and the variety of ways in which data can be
tagged in OpenStreetmap, can make Overpass QL a bit daunting to learn. And tricky to
use to get exactly the data you want.

But it is a very powerful language and is well suited to:

* running quick interactive explorations of OpenStreetmap data
* extracting small exports of data to use in other analysis tools
* integrating into simple scripts or applications that need to query the OSM database

This website aims to do several things:

* provide a range of useful queries that support people in making the most of the OSM data
* add to the range of learning materials for Overpass QL
* encourage the community to share useful queries, tips and tricks for making the most of the API

These goals means its intended to complement a number of other existing resources, including:

* [The Overpass Language Guide](https://wiki.openstreetmap.org/wiki/Overpass_API/Language_Guide) which provides a
detailed overview of the language syntax and functionality
* The [Overpass API by example](https://wiki.openstreetmap.org/wiki/Overpass_API/Overpass_API_by_Example) page on the OSM wiki which includes a range of examples
* And the [Overpass API user's manual](https://dev.overpass-api.de/overpass-doc/en/) which is still a work in progress

If you need more detail, then you're encouraged to explore these resources as well.
