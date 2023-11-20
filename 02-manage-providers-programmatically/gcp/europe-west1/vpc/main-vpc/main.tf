resource "google_compute_network" "vpc" {
  name = terramate.stack.name
}
