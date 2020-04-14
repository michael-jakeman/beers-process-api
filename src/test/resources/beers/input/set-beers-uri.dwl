%dw 2.0
output application/java
---
{
	full: "http://localhost:8092/v1/beers" as String,
	emptyPath: "http://localhost:8092" as String
}