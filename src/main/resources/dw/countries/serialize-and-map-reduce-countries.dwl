%dw 2.0
import modules::common
output application/json
---
write(common::mapReduce(payload, "alpha2Code"), "application/json")