package main

import (
	"fmt"
	"runtime"
)

func main() {
  fmt.Printf("[%v] CLI golang app (ubuntu)\n",runtime.Version())
}
