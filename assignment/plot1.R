## Read Data from csv file
fn <- "household_power_consumption.txt"
hpc <- read.csv(fn, sep=";")

## Select data from 2007-02-01 to 2007-02-02
FebData<-hpc[as.Date(hpc$Date,format="%d/%m/%Y") >= as.Date("2007-02-01") & 
                 as.Date(hpc$Date,format="%d/%m/%Y") <= as.Date("2007-02-02"),]


## Store values of Global Active Power in a vector
z<-as.numeric(as.character(FebData$Global_active_power))


## Create plot1.png
png(file="plot1.png")
hist(z, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()
