%dw 2.0
// Converts an array into a hashmap so we can pull out values safely without iterating over arrays.
fun mapReduce(items: Array, key: String): Object = do {
	items reduce ((item, m={}) ->
		m ++ { (item[key]) : item }
	)
}