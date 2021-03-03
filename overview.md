OpenStreetMap is an openly licensed geospatial database. It's regularly used in
a very wide range of applications that include some of the smallest and largest
sites you'll find on the web.

If you're using OpenStreetMap as a base map, then there are dozens of ways
that you can integrate it into your web application. Similarly, if you're
doing complex analysis of the data then you'll be taking extracts to process and
index locally. There are lots of tools and services to help you achieve both of those
things.

But many potential uses of the data lie somewhere in between: you just want to do
relatively small queries of the database to extract some data for a quick analysis,
build a simple map or support you in keeping the data up to date.

## The Overpass API, OverpassQL and Overpass Turbo

For that you'll need to use the [Overpass API](https://wiki.openstreetmap.org/wiki/Overpass_API).
This is an openly accessible API that supports queries against the live OSM database (and in some
cases, also against historical data).

You can use the API to integrate OSM data directly into your application. GIS tools
like [QGIS also allow you to work with the API](https://docs.qgis.org/3.16/en/docs/training_manual/qgis_plugins/plugin_examples.html), bringing data directly into your workspace.

There's also a freely available web based IDE called [Overpass Turbo](https://overpass-turbo.eu/)
that can help you write and run queries, save and share them and explore results.

But, to get the most from those tools and the API you'll need to learn how to write
queries using a custom query language called [Overpass QL](https://wiki.openstreetmap.org/wiki/Overpass_API/Overpass_QL).

## An openly licensed collection of Overpass queries

This website provides collections of OverpassQL queries to help you to learn the
language and exploe the features.

Each of the themed collections includes a number of Overpass queries that you can
immediately load and run via the Overpass Turbo editor. The collection also includes
a worked tutorial that covers the core syntax of the language.

All of the content and queries are [in the public domain](licence.html) so can be
freely reused, shared or adapted as you see fit.

[Read more about the goals of this website](background.html).

## Contribute

The content and source for this website is completely open. The intention is to update
the website with new examples and tutorials over time.

If you're interested in contributing to that work, then read [how to contribute](contribute.html)
