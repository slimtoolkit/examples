package main

import (
	"context"
	"fmt"
	"net"
	"net/http"
	"os"
	"os/signal"
	"syscall"
	"time"
)

func main() {
	router := http.NewServeMux()
	router.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
		w.WriteHeader(http.StatusOK)
		w.Header().Add("Content-Type", "text/plain")
		w.Write([]byte("Hello World"))
	})

	l, err := net.Listen("tcp", ":1300")
	if err != nil {
		fmt.Println(err)
		os.Exit(1)
	}

	srv := &http.Server{Handler: router}
	singnalChan := make(chan os.Signal, 1)
	signal.Notify(singnalChan, os.Interrupt, syscall.SIGTERM)

	go func() {
		<-singnalChan
		fmt.Println("Shutting down server...")
		ctx, cancel := context.WithTimeout(context.Background(), 15*time.Second)
		defer cancel()
		srv.Shutdown(ctx)
	}()

	fmt.Println("Server running on port 1300")
	err = srv.Serve(l)

	if err != nil {
		if err == http.ErrServerClosed {
			fmt.Println("Received shutdown signal, stop listening and closing server...")
			return
		}
		fmt.Println(err)
		os.Exit(1)
	}
}
