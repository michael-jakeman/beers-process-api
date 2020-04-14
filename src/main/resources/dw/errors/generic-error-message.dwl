%dw 2.0
output application/json
---
{
	message: error.errors[0].errorType.identifier
}