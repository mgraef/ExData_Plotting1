## Read Data from csv file
fn <- "household_power_consumption.txt"
hpc <- read.csv(fn, sep=";")

## Select data from 2007-02-01 to 2007-02-02
FebData<-hpc[as.Date(hpc$Date,format="%d/%m/%Y") >= as.Date("2007-02-01") & 
                 as.Date(hpc$Date,format="%d/%m/%Y") <= as.Date("2007-02-02"),]


## Store values of Global Active Power in a vector
z<-as.numeric(as.character(FebData$Global_active_power))

## Store values of DateTime in a vector
tt<-as.POSIXct(paste(FebData$Date,FebData$Time),format="%d/%m/%Y %H:%M:%S")

## Create plot2.png
png(file="plot2.png")
plot(tt,z,type="l",ylab="Global Active Power (kilowatts)",xlab="")
dev.off()
