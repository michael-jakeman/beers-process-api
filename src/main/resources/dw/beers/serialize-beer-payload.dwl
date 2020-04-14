%dw 2.0
output application/java
---
//TODO: Enrich the payload that's going to be cached'
write(payload, "application/json")