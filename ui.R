
shinyUI(pageWithSidebar(
        
        # Application title
        headerPanel("Target Salary Modelling"),
        
        sidebarPanel(
                numericInput("ev.no", label="Current Salary",val=35000, min=0, max=1000000, step=5000),
                numericInput("x2",label="high end asking salary", val=65000, min=0, max=1000000, step=5000),
                sliderInput(inputId="py.x2",label="Probability of achieving high end asking salary", val=0.5,min=0, max=1, step=0.05),
                numericInput("x1", label="low end asking salary",val=50000, min=0, max=1000000, step=5000),
                sliderInput(inputId="py.x1",label="Probability of achieving low end asking salary", val=0.5,min=0, max=1, step=0.05)
        ),
        mainPanel(
                h2("Result of prediction"),
                h4("you entered:"),
                h4("Current salary"),
                verbatimTextOutput("ev.no"),
                h4("high end asking salary"),
                verbatimTextOutput("x2"),
                h4("Probability of achieving high end asking salary"),
                verbatimTextOutput("py.x2"),
                h4("low end asking salary"), 
                verbatimTextOutput("x1"),
                h4("Probability of achieving low end asking salary"),
                verbatimTextOutput("py.x1"),
                h3("Which resuted in a prediction of"),
                verbatimTextOutput("my.offer")
        )  
)
)
