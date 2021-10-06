dashboardPage(
  dashboardHeader(title="DROM adjuster"),
  dashboardSidebar(
    selectInput("choix_drom","DROM",choices = c('glp','mtq','guf','reu','myt')),
    numericInput("shift_lon","Shift Longitude",value=0,step = .001),
    numericInput("shift_lat","Shift Latitude",value=0,step = .001),
    numericInput("scale","Scale polygon",value=1,step = 0.01),
    actionButton("save","Save params",icon=icon('save'))
  ),
  dashboardBody(
    leafletOutput("map")
  )
)
