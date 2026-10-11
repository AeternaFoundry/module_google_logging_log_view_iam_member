resource "google_logging_log_view_iam_member" "logging_log_view_iam_members" {
  for_each = var.logging_log_view_iam_members

  bucket   = each.value.bucket
  member   = each.value.member
  name     = each.value.name
  parent   = each.value.parent
  role     = each.value.role
  location = each.value.location

  dynamic "condition" {
    for_each = each.value.condition != null ? [each.value.condition] : []
    content {
      description = condition.value.description
      expression  = condition.value.expression
      title       = condition.value.title
    }
  }
}

