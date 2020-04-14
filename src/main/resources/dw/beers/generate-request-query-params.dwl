%dw 2.0
output application/json skipNullOn="everywhere"
---
{
	name: attributes.queryParams.name
}