terraform {
  backend "remote" {
    organization = "coding-buddies"

    workspaces {
      name = "core"
    }
  }
}
