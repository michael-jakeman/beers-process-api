%dw 2.0
import java!com::mike::ResolveUri
fun remove(name) =
 if(isEmpty(vars.filter))
 		false 
 else if (vars.filter contains(name))
		false
	else
		true
fun filterOutput(name, value) = 
	if(remove(name)) null else value
output application/json skipNullOn="everywhere"
---
/**
 * Unfortunately the filterObject method in dataweave does not work when filtering an object when also using contains.
 * https://docs.mulesoft.com/mule-runtime/4.2/dw-core-functions-filterobject
 * So if we do filterObject vars.filter contains "name" this will not filter to name.
 * 
 * As a work around I've created filterOutput function until filterObject can filter based off anyMatch.
 */
write({
	id: vars.uri.full,
	totalNumberOfItems: payload.totalResults,
	numberOfItems: if (payload.totalResults > 0)sizeOf(payload.data) else 0,
	items: (payload.data default []) map (beer) -> {
		id: ResolveUri::resolve(((vars.uri.full splitBy("?"))[0]),  ("./beers/" ++ beer.id)),
		identifier: beer.id,
		name: filterOutput("name", beer.name),
		description: filterOutput("description", beer.description),
		abv: filterOutput("abv", beer.abv)
	}
}, "application/json")
