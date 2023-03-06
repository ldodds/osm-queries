/*
This query can be used to highlight issues with address data.

It find features with an `addr:street` tag whose value doesn't match the name of local street.

The intention is to highlight potential data errors. There may be reasons why
the tags and values are different, but it might also highlight simple typos.

Try adjusting it to use your local town by replacing "Bath" with a different name.

This is adapted from an example given in the Overpass developer blog. It shows
some advanced features of OverpassQL language including creating objects,
manipulating sets and use of functions.

@see https://wiki.openstreetmap.org/wiki/Overpass_API/Areas
@see https://dev.overpass-api.de/blog/sliced_time_and_space.html
@title Mismatched streets
*/
//find the area called Bath, saving to named set
area[name="Bath"]->.a;

//find all the ways tagged as highway in the named set
way(area.a)[highway];

//make a temporary element called "stat".
//give it a name tag whose value will be the set of all highway names
//save it in another temporary result set called "all"
make stat name=set(t["name"])->.all;

//find any node, way or relation in the area we first matched
nwr(area.a)["addr:street"];

//loop through all of the addr:street tags in the results
//anything without a value for this tag will be ignored
for (t["addr:street"])
{
  //Lots going on here, so to break it down:
  //`lrs_in` is a function that checks to see if its first argument can be found in the second
  //_.val is the current value of the `for` loop
  // all.u is the union of all name tag values in the "all" set. In short, the list of all streets
  //
  //So this conditional returns true if the value of the `addr:street` tag for
  //the current nodes is NOT in the list of names we found earlier
  if (!lrs_in(_.val, all.u(t["name"])))
  {
    //output a point for the match
    //this is the node, or a centroid for ways/relations
    out center;
  }
}
