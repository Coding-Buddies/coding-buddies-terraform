resource "digitalocean_domain" "codingbuddies_dev" {
  name = "codingbuddies.dev"
}

# MX records for email
resource "digitalocean_record" "codingbuddies_email_txt" {
  domain  = digitalocean_domain.codingbuddies_dev.name
  type    = "TXT"
  name    = "@"
  value   = "v=spf1 include:spf.privateemail.com ~all"
}

resource "digitalocean_record" "codingbuddies_email_mx" {
  domain    = digitalocean_domain.codingbuddies_dev.name
  type      = "MX"
  name      = "@"
  value     = "mx${count.index + 1}.privateemail.com."
  count     = 2
  priority  = count.index
}

# TXT record for GitHub verification
resource "digitalocean_record" "codingbuddies_github_verify" {
  domain  = digitalocean_domain.codingbuddies_dev.name
  type    = "TXT"
  name    = "_github-challenge-Coding-Buddies"
  value   = "22954ce2fb"
}

