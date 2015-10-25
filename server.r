pop<-function(p,h,g,pe,he){
        mat<-data.frame()
        mat[1,1]<-p
        mat[1,2]<-h
        mat[1,3]<-g
        for(i in 2:100){                        
                mat[i,1]<-mat[i-1,1]+pe*mat[i-1,1]*mat[i-1,2]-0.1*mat[i-1,1]
                mat[i,2]<-mat[i-1,2]+he*mat[i-1,3]*mat[i-1,2]-0.05*mat[i-1,2]-pe*mat[i-1,2]*mat[i-1,1]
                mat[i,3]<-mat[i-1,3]+0.5*mat[i-1,3]-0.01*mat[i-1,3]-he*mat[i-1,3]*mat[i-1,2]
                
                if (mat[i,1]<=1) {mat[i,1]=0
                                  break}
                if (mat[i,2]<=1) {mat[i,2]=0
                                  break}
                if (mat[i,3]<=1) {mat[i,3]=0
                                  break}
                pe<-pe*(mat[i,2]/mat[i-1,2])
                he<-he*(mat[i,3]/mat[i-1,3])
        }
        plt<-matplot(mat,type ="l",xlab="Time",ylab="Population Size[Individuals]",lwd=2,lty=1, col=c(2,4,3)) 
        legend("topleft",  legend=c("Predator", "Herbivor","Grass"),lwd=2, col=c(2,4,3), horiz=TRUE)
}
        


library(shiny)
shinyServer(
        function(input,output){                
                observeEvent(input$goButton, {
          output$graph<-renderPlot(isolate(pop(input$pred,input$herb,input$grass,input$pred_eff,input$herb_eff)))
                }
                )
        }
)