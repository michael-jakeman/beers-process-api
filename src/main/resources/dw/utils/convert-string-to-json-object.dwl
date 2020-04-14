%dw 2.0
output application/json skipNullOn="everywhere"
---
read(payload, "application/json")