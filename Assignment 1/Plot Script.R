fileName <- "household_power_consumption.txt"
electData <- read.table(fileName, header= T , sep=";")

electData[,1] <- as.Date(electData[ , 1] , format="%d/%m/%Y" )
electData <- electData[electData$Date >= "2007-02-01" & electData$Date <= "2007-02-02", ]
electData[,3] <- as.numeric(electData[,3])

png(filename="plot1.png" , width=480, height = 480 )
hist(electData[, 3], main="Global Active Power" , col="red")
dev.off()

png(filename="plot2.png" , width=480, height = 480 )
plot( strptime( paste(electData[,1] , electData[,2]) , format = "%Y-%m-%d %H:%M:%S" ) ,  electData[,3] , type="l" , xlab="" , ylab="Global Active Power (Kilowatts)")
dev.off()

png(filename="plot3.png" , width=480, height = 480 )
plot( strptime( paste(electData[,1] , electData[,2]) , format = "%Y-%m-%d %H:%M:%S" ) ,  electData[,7] , type="l" , xlab="" , ylab="Energy Sub Meeting") 
lines( strptime( paste(electData[,1] , electData[,2]) , format = "%Y-%m-%d %H:%M:%S" ) ,  electData[,8] , type="l" , col="red" ) 
lines( strptime( paste(electData[,1] , electData[,2]) , format = "%Y-%m-%d %H:%M:%S" ) ,  electData[,9] , type="l" , col="blue") 
legend(2000,9.5, c("Sub Metering 1","Sub Metering 2" , "Sub Metering 3") , 
lty= c(1,1,1) ,
lwd= c(2.5, 2.5, 2.5) ,  
col= c("black","blue","red")
)
dev.off()

png(filename="plot4.png" , width=480, height = 480 )
par(mfrow=c(2,2))

plot( strptime( paste(electData[,1] , electData[,2]) , format = "%Y-%m-%d %H:%M:%S" ) ,  electData[,3] , type="l" , xlab="" , ylab="Global Active Power (Kilowatts)")
plot( strptime( paste(electData[,1] , electData[,2]) , format = "%Y-%m-%d %H:%M:%S" ) ,  electData[,5] , type="l" , xlab="" , ylab="Voltage")
plot( strptime( paste(electData[,1] , electData[,2]) , format = "%Y-%m-%d %H:%M:%S" ) ,  electData[,7] , type="l" , xlab="" , ylab="Energy Sub Meeting") 
lines( strptime( paste(electData[,1] , electData[,2]) , format = "%Y-%m-%d %H:%M:%S" ) ,  electData[,8] , type="l" , col="red" ) 
lines( strptime( paste(electData[,1] , electData[,2]) , format = "%Y-%m-%d %H:%M:%S" ) ,  electData[,9] , type="l" , col="blue") 
legend(2000,9.5, c("Sub Metering 1","Sub Metering 2" , "Sub Metering 3") , 
       lty= c(1,1,1) ,
       lwd= c(2.5, 2.5, 2.5) ,  
       col= c("black","blue","red")
)
plot( strptime( paste(electData[,1] , electData[,2]) , format = "%Y-%m-%d %H:%M:%S" ) ,  electData[,3] , type="l" , xlab="" , ylab="Global_reactive_power")
dev.off()