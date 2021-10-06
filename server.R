function(input,output,session){
  
  output$map = renderLeaflet(
    m
  )
  
  observe({
    req(input$choix_drom)
    req(input$shift_lon)
    req(input$shift_lat)
    req(input$scale)
    one_drom = input$choix_drom
    # browser()
    
    poly_drom = shift_drom(drom_list,one_drom,
                            input$shift_lon,input$shift_lat,input$scale)
    proxy = leafletProxy("map",session)
    proxy %>% 
      clearGroup(one_drom)%>%
      addPolygons(data=poly_drom,group=one_drom)
  })
  
  observeEvent(input$save,{
    req(input$save)
    print('save')
    transfo = data.table(scale=input$scale,shift_lon=input$shift_lon,shift_lat=input$shift_lat)
    fwrite(transfo,sprintf("transfo/transfo_%s.csv",input$choix_drom))
  })
  
}
