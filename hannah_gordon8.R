#Exercise 8
#Hannah Gordon

#Question 1
#Using the score-by-score information from
#this game summarized in "UWvMSU_1-22-13.txt" generate a graph similar to the one I show above. Don't
#worry about how pretty your graph is. Focus more on the control structures required in your script used to
#generate the plot.

#set working directory
setwd("/Users/Public/Documents/Biocomputing2020_Tutorial10")

#read in the data
UWvMSUdata<-read.delim(file="UWvMSU_1-22-13.txt", header=TRUE, stringsAsFactors=FALSE)

#create variables for scores to be added to
UWsum=0
MSUsum=0

#create a matrix
UWvMSUscores=data.frame(matrix(nrow=nrow(UWvMSUdata),ncol=3))

#add titles to the columns that correspond to the "UWvMSUdata" columns
columntitles<-c("Time","UW","MSU")
colnames(UWvMSUscores)<-columntitles

#create a for loop to add UW scores together and MSU scores together
for(i in 1:nrow(UWvMSUdata)){
  
  if(UWvMSUdata$team[i] == "UW"){
    UWsum=UWsum+UWvMSUdata$score[i]
  }else{
    MSUsum=MSUsum+UWvMSUdata$score[i]
  }
  
  #add the corresponding data into the corresponding columns of the matrix we made
  UWvMSUscores$Time[i] = UWvMSUdata$time[i]
  UWvMSUscores$UW[i] = UWsum
  UWvMSUscores$MSU[i] = MSUsum
}

#plot the data
plot(UWvMSUscores$Time, UWvMSUscores$UW, type="l", col="red", main="University of Wisconsin-Madison vs Michigan State University", xlab="Time", ylab="Score")
lines(UWvMSUscores$Time, UWvMSUscores$MSU, col="green")

#I wasn't sure how to make the time into quarters like the example
#so I left the x-axis as time, I hope this is okay

#Question 2
#Write a game called "guess my number". The computer will generate a random number between 1 and
#100. The user types in a number and the computer replies "lower" if the random number is lower than the
#guess, "higher" if the random number is higher, and "correct!" if the guess is correct. The player can continue
#guessing up to 10 times

#select a numer from 1-100
randomNum<- sample(1:100, 1)

#create a variable that will track the number of play
numPlays=0

#greet the player with the game
print("Welcome to Guess My Number. You have 10 tries to guess what number between 1 and 100 that I am thinking of.")

#create a space for user to guess
while(numPlays < 11){ 
  guess <- readline(prompt="Guess a number between 1 and 100: ")
  guess <- as.integer(guess)
  
  if(guess == randomNum){ 
    print("Correct!")
    numPlays <- numPlays + 11
  }else if(guess > randomNum){
    print("Lower")
    numPlays <- numPlays + 1
  }else{
    print("Higher")
    numPlays <- numPlays + 1
  }
}