get_constants <- function(file_path, file_name, filter_id) {
  # Create global environment
  env <- globalenv()
  
  # Create constants folder
  if (!file.exists('constants')){
    dir.create('constants/')
  }
  
  if(is.list(filter_id)) {
    filters <- names(filter_id)
  } else {
    filters <- filter_id
  }
  
  if(all(filters %in% dir('constants/'))) {
    for(f in filters) {
      load(paste0("constants/",f))
      env[[f]] <- eval(parse(text=f))
      
    }

  } else {
    load(file_path)
    
    for(f in filters) {
      if(is.na(file.info(paste0("constants/",f))$mtime)) {
        eval(parse(text=paste0(f, ' <- sort(unique(' ,file_name , '[[\'', f, '\']]))')))
        env[[f]] <- eval(parse(text=f))
        save(list=f, file=paste0("constants/",f))
      }
    }
    # Remove data file to avoid memory leak
    eval(parse(text=paste0('rm(', file_name, ')')))
    gc()
    
  }
  

  
}

