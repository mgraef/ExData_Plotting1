## Read Data from csv file
fn <- "household_power_consumption.txt"
hpc <- read.csv(fn, sep=";")

## Select data from 2007-02-01 to 2007-02-02
FebData<-hpc[as.Date(hpc$Date,format="%d/%m/%Y") >= as.Date("2007-02-01") & 
                 as.Date(hpc$Date,format="%d/%m/%Y") <= as.Date("2007-02-02"),]


## Store values of Sub Metering in 3 separate vectors
Sub_metering_1<-as.numeric(as.character(FebData$Sub_metering_1))
Sub_metering_2<-as.numeric(as.character(FebData$Sub_metering_2))
Sub_metering_3<-as.numeric(as.character(FebData$Sub_metering_3))

## Store values of DateTime in a vector
tt<-as.POSIXct(paste(FebData$Date,FebData$Time),format="%d/%m/%Y %H:%M:%S")


## Create plot3.png
png(file="plot3.png")
plot(tt,Sub_metering_1,type="n",ylab="Energy sub metering",xlab="")
legend("topright",col=c("black","red","blue"),lty=1,
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
points(tt,Sub_metering_1,type="l",col="black")
points(tt,Sub_metering_2,type="l",col="red")
points(tt,Sub_metering_3,type="l",col="blue")
dev.off()
