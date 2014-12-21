render_button <- function() {
  
  tagList(
    
    singleton(
      tags$head(
        includeCSS('www/render.css')
      )
    ),
    
    div(class='button', width='100%',
        actionButton(inputId='render', label="Render!", icon('refresh'))
    )
  )
  
}