%dw 2.0
var fields = attributes.queryParams.fields
output application/java
---
if (not isEmpty(fields)) 
	((fields as String) splitBy(",")) 
else []