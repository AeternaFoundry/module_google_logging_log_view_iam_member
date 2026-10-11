variable "logging_log_view_iam_members" {
  description = <<EOT
Map of logging_log_view_iam_members, attributes below
Required:
    - bucket
    - member
    - name
    - parent
    - role
Optional:
    - location
    - condition (block):
        - description (optional)
        - expression (required)
        - title (required)
EOT

  type = map(object({
    bucket   = string
    member   = string
    name     = string
    parent   = string
    role     = string
    location = optional(string)
    condition = optional(object({
      description = optional(string)
      expression  = string
      title       = string
    }))
  }))
}

