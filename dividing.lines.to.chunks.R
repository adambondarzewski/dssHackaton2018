create.lines.chunks <- function(lines, chunk.length = 20) {
  sapply(split(lines, (seq_along(lines)-1) %/% chunk.length), paste, collapse = ",")
}

line.chunks <- create.lines.chunks(lines)
