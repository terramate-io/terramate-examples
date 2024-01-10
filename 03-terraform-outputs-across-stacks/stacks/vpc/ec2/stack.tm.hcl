stack {
  name        = "Compute Instance"
  description = "An example EC2 instance"
  id          = "fd944951-2497-4a75-a93c-f486975c3777"
}

#
# We depend on the 'vpc' stack and want to auto generate
# remote state datasource to be able to access stack outputs.
#
globals "dependencies" {
  vpc = true
}
