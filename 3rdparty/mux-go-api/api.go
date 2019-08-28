package main

import (
	"fmt"
	"log"
	"net/http"
	"github.com/gorilla/mux"
)

func Home(w http.ResponseWriter, r *http.Request) {
	fmt.Fprintln(w, "Hello World!")
}

func AllNotes(w http.ResponseWriter, r *http.Request) {
	fmt.Fprintln(w, "All Notes!")
}

func FindNote(w http.ResponseWriter, r *http.Request) {
	fmt.Fprintln(w, "Find Note!")
}

func CreateNote(w http.ResponseWriter, r *http.Request) {
	fmt.Fprintln(w, "Create Note!")
}

func UpdateNote(w http.ResponseWriter, r *http.Request) {
	fmt.Fprintln(w, "Update Note!")
}

func DeleteNote(w http.ResponseWriter, r *http.Request) {
	fmt.Fprintln(w, "Delete Note!")
}

func main() {
	r := mux.NewRouter()
	r.HandleFunc("/", Home).Methods("GET")
	r.HandleFunc("/notes", AllNotes).Methods("GET")
	r.HandleFunc("/notes", CreateNote).Methods("POST")
	r.HandleFunc("/notes", UpdateNote).Methods("PUT")
	r.HandleFunc("/notes", DeleteNote).Methods("DELETE")
	r.HandleFunc("/notes/{id}", FindNote).Methods("GET")
	if err := http.ListenAndServe(":3000", r); err != nil {
		log.Fatal(err)
	}
}