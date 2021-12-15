package main

import (
	"fmt"
	"runtime"
)

func main() {
  fmt.Printf("[%v] CLI golang app (standard)\n",runtime.Version())
}
