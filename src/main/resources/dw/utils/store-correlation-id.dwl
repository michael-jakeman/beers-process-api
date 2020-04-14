%dw 2.0
output application/java
---
(if (isEmpty(attributes.correlationId)) uuid() else attributes.correlationId) as String