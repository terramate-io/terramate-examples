stack {
  name        = "Networking"
  description = "A VPC and a Subnet"
  id          = "c2c67b6a-5cc5-4129-b684-f471548781d5"
}

#
# We make this stack available as a dependency for nested stacks
# If we want to globally make the dependency available move this block up in the
# directory hierarchy
#
globals "available_dependencies" {
  vpc = "c2c67b6a-5cc5-4129-b684-f471548781d5"
}
