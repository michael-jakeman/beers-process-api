%dw 2.0
import java!com::mike::ResolveUri
output application/json
---
write({
	id: vars.uri.full,
	totalNumberOfItems: payload.totalResults,
	numberOfItems: if (payload.totalResults > 0)sizeOf(payload.data) else 0,
	items: (payload.data default []) map (beer) -> {
		id: ResolveUri::resolve(vars.uri.full,  ("./beers/" ++ beer.id)),
		identifier: beer.id,
		name: beer.name,
		description: beer.description,
		abv: beer.abv
	} 
}, "application/json")
