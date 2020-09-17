provider "google" {
  credentials = file("~/.ssh/test-bench-2020082-57e40899bf18.json")
  project =  "test-bench-2020082"
}