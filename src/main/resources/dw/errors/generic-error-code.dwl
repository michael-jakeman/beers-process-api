%dw 2.0
output application/java
---
error.errors[0].errorType.identifier match {
	case "NOT_FOUND" -> 404
	else -> 500
}