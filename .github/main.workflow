workflow "PR Validation" {
  on = "pull_request"
  resolves = ["docker://ubuntu:latest"]
}

action "docker://ubuntu:latest" {
  uses = "docker://ubuntu:latest"
  args = "env && cat /github/workflow/event.json"
}
