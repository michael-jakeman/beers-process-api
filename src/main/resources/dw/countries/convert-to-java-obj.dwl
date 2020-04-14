%dw 2.0
output application/java
---
read(payload, "application/json")