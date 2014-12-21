input_widget_control <- function(session, input, vars=NULL) {
  if(is.null(vars)) {
    return(NULL)
  }
  for(flt in vars) { 
    if(length(input[[flt]])==0) {
      updateSelectInput(session, inputId=flt, selected='All', choices=c('All', globalenv()[[flt]]))
    } else if('All' %in% input[[flt]] & length(input[[flt]])>1) {
      updateSelectInput(session, inputId=flt, selected=input[[flt]][which(input[[flt]]!="All")], choices=c('All', globalenv()[[flt]]))       
    }
  }
}