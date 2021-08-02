data "local_file" "this" { filename = var.filename }
locals {
        variables = merge([for list in [for s in split(var.newline_delimiter, data.local_file.this.content): split(var.inline_delimiter, s)]: length(list) >= 2 ? { (list[0]) = join(var.inline_delimiter, slice(list, 1, length(list))) } : {}]...)
}

