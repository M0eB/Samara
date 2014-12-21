options(rcharts.cdn = TRUE)
shinyUI(fluidPage(
  
  tagList(
    tags$head(tags$link(rel="stylesheet", type="text/css", href="style.css")
    )
  ),
  
  fluidRow(
    fluidRow(
      column(12,
             fluidRow(
               column(8,
                      fluidRow(
                        htmlOutput('table')
                      ),
                      
                      br(),
                      br(),
                      
                      fluidRow(
                        showOutput("graph", "highcharts")
                      )
               ),
               column(2,
                      wellPanel(
                        dateRangeInput(inputId = 'date', 
                                       label = 'Select Date Range', 
                                       start = min(date), 
                                       end = max(date), 
                                       min = min(date), 
                                       max = max(date)),        
                        
                         selectizeInput('party_name', 'Party Name', c('All', party_name), 'All', multiple=TRUE, options=list(plugins=list('remove_button'))),
                         selectizeInput('province', 'Province', c('All', province), 'All', multiple=TRUE, options=list(plugins=list('remove_button'))),
                         selectizeInput('city', 'City', c('All', city), 'All', multiple=TRUE, options=list(plugins=list('remove_button'))),
                         selectizeInput('flag.blank_contrib', 'Federal Contribution', c('All', flag.blank_contrib), 'All', multiple=TRUE, options=list(plugins=list('remove_button'))),
                         selectizeInput('target_riding', 'Riding', c('All', target_riding), 'All', multiple=TRUE, options=list(plugins=list('remove_button')))
                      )                      
               ),
               column(2,
                      wellPanel(
                        render_button(),
                        selectizeInput('date_coh', 'Choose Date Cohort', c('None', 'Year', 'Year-Month', 'Year-Month-Day'), multiple=FALSE),
                        selectizeInput('coh1', 'Cohort 1', cohort_selection, multiple=FALSE),
                        selectizeInput('coh2', 'Cohort 2', cohort_selection, multiple=FALSE),
                        selectizeInput('coh3', 'Cohort 3', cohort_selection, multiple=FALSE),
                        selectizeInput('coh4', 'Cohort 4', cohort_selection, multiple=FALSE),
                        radioButtons('aggregation', label = 'Aggregate vs. Individual Data', choices = c('Aggregated', 'Individual'), selected = 'Aggregated'),
                        conditionalPanel(condition = 'input.aggregation=="Individual"',
                                         sliderInput('number_records', 'Top X Contributors', min = 1, max = 50, value = 5)
                        )
                        
                        
                      )
               )               
             )         
      )
    )
  )
))