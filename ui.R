library(shiny)
library(shinyBS)

shinyUI(fluidPage(
  titlePanel("REDCap test"),
  tabsetPanel(
    tabPanel("Data Entry",
             column(4,
             textInput("firstname","First Name"),
             textInput("lastname","Last Name"),
             textInput("strcitystname","Street, City, State, ZIP"),
             textInput("phone","Phone Number"),
             textInput("email","E-Mail"),
             dateInput("dob","Date of birth",startview = "decade"),
             selectInput("ethn","Ethnicity",choices=c("Hispanic or Latino"=0,"Not Hispanic or Latino"=1,"Unknown /Not Reported"=2))
             ),
             column(4,offset=1,
             selectInput("race","Race",choices=c("American Indian/Alaska Native"=0,"Asian"=1,"Native Hawaiian or Other Pacific Islander"=2,
                                                 "Black or African American"=3,"White"=4,"More Than One Race"=5,"Unknown/Not Reported"=6)),
             radioButtons("gen","Gender",choices=c("Female"=0,"Male"=1)),
             numericInput("ht","Height(cm)",value = NULL),
             numericInput("wt","Weight(kilograms)", value= NULL),
             h3("General Comments"),
             textInput("comments","Comments"),
             actionButton(inputId="upload","Upload entry to REDCap",icon=icon("cog")))
    ),
    tabPanel("Data Table", dataTableOutput("redcaptable")),
    tabPanel("Graphs", 
             plotOutput("heighthist",width="400px",height="400px"),
             plotOutput("agehist",width="400px",height="400px")
    )
  )
))