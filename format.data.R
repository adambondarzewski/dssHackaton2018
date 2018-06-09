data.formatted <- data.raw

data.formatted %<>% mutate_at(vars(starts_with("speed")), funs(as.numeric))
data.formatted %<>% mutate_at(vars(matches("lon|lat")), funs(as.numeric))
