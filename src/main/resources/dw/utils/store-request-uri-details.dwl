%dw 2.0
output application/java
---
{
	full: ((attributes.scheme ++ "://" ++ attributes.localAddress ++ attributes.requestUri) default "") as String,
	emptyPath: (attributes.scheme ++ "://" ++ attributes.localAddress) as String
}