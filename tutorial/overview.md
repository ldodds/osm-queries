This is a collection of queries that provides a simple tutorial that introduces
the core features and syntax of the Overpass QL query language.

Each of the queries introduces a specific feature of the language, starting
from querying for simple points of interest through to more complex spatial
queries.

By the end of the tutorial you will learn:

* some basics of the OpenStreetMap data model
* how to write queries to extract nodes, ways and relations from the OSM database using a variety of different methods
* how to filter data to extract just the features of interest
* how to write spatial queries to find features based on whether they are within specific areas or are within proximity to one another
* how to output data as CSV and JSON for use in other tools

## How to use the tutorial

Step through each of the queries in turn. They're numbered to help you do
that.

Each query introduces a specific feature of the language, with subsequent
queries showing variations of how to use that feature. Or how to combine it
with other features to do more complex queries.

Read the descriptions and then review the query. Comments are included
to describe the important elements of the query.

Click the green run button to try the query against the live database.

Your browser will open up a new page, loading the query and the description
into the [Overpass Turbo IDE](https://wiki.openstreetmap.org/wiki/Overpass_turbo).

The query will run automatically so you can see the results.

Many of the queries include commented out sections marked as `//TRYME`.
These indicate sections of the query that you can customise to explore more
of the functionality. Instructions are given in each example.

Once you have the query open in the IDE, you can remove these comments to try
out variations of the query. Be sure to hit the "Run" button in the IDE
to see your new results.

## The geographic area for the tutorial

Apart from the first query, the queries in the tutorial use the OpenStreetMap
data describing an area in and around [Uluṟu](https://en.wikipedia.org/wiki/Uluṟu) within the [Uluṟu-Kata Tjuṯa National Park](https://en.wikipedia.org/wiki/Ulu%E1%B9%9Fu-Kata_Tju%E1%B9%AFa_National_Park)
in Australia.

Working with natural features makes it more likely that the queries will consistently
return the expected results with the area. But the functionality can be applied
to any area of the map.

I also chose this setting to hopefully prompt a bit of reflection in the reader
about how maps are created, who they are created for, and what data they contain.

[Indigenous data sovereignty](https://www.stateofopendata.od4d.net/chapters/issues/indigenous-data.html) isn't the intended focus of this tutorial, but they are relevant issues for anyone
creating or using open data.

So I encourage you to reflect on what you learn as you run these queries.
What tags are used? Who is doing the tagging? What features are significant and
why? And how can OpenStreetMap empower local communities to build and maintain their own maps?

## Results not displaying?

Overpass Turbo remembers which area of OpenStreetMap you were last looking at.

So when you revisit it, you're usually looking at the same location. This can
mean that sometimes after a query is loaded and run in the editor, you might be
looking at the wrong map location.

This can also happen if you're copying and pasting queries into the editor and
running them manually.

If this happens use the "Zoom to Data" option in the map view, which is
shown as a magnifying glass icon. The map will then automatically recentre on
the query results.
