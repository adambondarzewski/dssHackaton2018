LINES_SLEEP <- 0 # sleep for loop not to overload api

data.raw <- data.table()

for(chunk.chosen in line.chunks) {
  
  url <- sprintf('https://hackaton.vavel.waw.pl/api/hackathon/v1/vehicles/processed/?line=%s',
                 chunk.chosen)
  
  Sys.sleep(LINES_SLEEP)
  
  r <- GET(url, add_headers(.headers = h))
  
  tryCatch({
    stopifnot(r$status_code != 429)
  }, error = function(err) {
    stop(err)
  })
  
  data.json <- content(r)
  
  
  # dealing with null values in jsons
  data.json <- lapply(data.json, function(x) {
    x[sapply(x, is.null)] <- NA
    unlist(x)
  })
  
  # converting to data.table
  data.raw <- rbindlist(list(data.raw, as.data.table(do.call("rbind", data.json))))
}
