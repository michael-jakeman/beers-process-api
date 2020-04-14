%dw 2.0
import java!com::mike::ResolveUri
var beer = payload[1].payload.data
var countries = vars.countries as Object
output application/json
---
//TODO: Add negative scenario here
write(({
	id: vars.uri.full,
	identifier: beer.id,
	name: beer.name,
	abv: beer.abv,
	breweries: beer.breweries map (brewery) -> {
		// Resolve is in src/main/java and is a basic wrapper of the java URI object to allow relative path manipulation
		id: ResolveUri::resolve(vars.uri.full, ("./../breweries/" ++ brewery.id)),
		identifier: brewery.id,
		name: brewery.name,
		locations: (brewery.locations) map (location) -> using ( country = countries[location."countryIsoCode"]) {
			name: location.name,
			country: {
				name: country.name,
				flag: country.flag,
				population: country.population
			}
		}
	}
}), "application/json")