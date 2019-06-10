workflow "PR Validation" {
  on = "pull_request"
  resolves = ["docker://ubuntu:latest-1"]
}

action "docker://ubuntu:latest" {
  uses = "docker://ubuntu:latest"
  args = "env"
}

action "docker://ubuntu:latest-1" {
  uses = "docker://ubuntu:latest"
  needs = ["docker://ubuntu:latest"]
  args = "cat /github/workflow/event.json"
}
