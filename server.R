shinyServer(
        function(input, output){
                my.offer <- reactive({
                        high=input$x1+50000
                        p.payoff=1
                        theta <- solve(matrix(c(1,1,input$x1,input$x2),nc=2),matrix(qlogis(c(input$py.x1,input$py.x2)),nc=1))  
                        payoff <- function(x) {
                                tmp <- exp(-theta[1]-theta[2]*x)
                                return( (input$ev.no + ifelse(input$ev.no>x*p.payoff,input$ev.no,x*p.payoff)*tmp)/(1+tmp) )
                        } 
                        
                        return(optimize(payoff,interval=c(input$ev.no,high),maximum=TRUE))
                        my.offer()
                })      
             
output$ev.no<-renderPrint({input$ev.no})
output$x2<-renderPrint({input$x2})
output$x1<-renderPrint({input$x1})
output$py.x1<-renderPrint({input$py.x1})
output$py.x2<-renderPrint({input$py.x2})                             
output$my.offer<-renderPrint({my.offer()})  
        }
)
