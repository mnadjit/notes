```go
package main

import (
	"fmt"
	"strconv"
)

func main() {
	// convert number from base 16 into decimal; 32 is size of output (i) in bits
	i, err := strconv.ParseInt("cafe", 16, 32)
	if (err != null){
		fmt.println(err)
		return;
	}
	fmt.Println(i) // out: 51966
}
```

```go
// number to ascii
fmt.Println(fmt.Sprintf("%x", 51966)) // out: 'cafe'
fmt.Println(fmt.Sprintf("%08b", 41)) // out: '00101001'
```