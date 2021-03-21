# Instant Comics app
## Specs
* Xcode 12.1
* Swift 5 and SwifUI
* iOS deployment target 14.1

## Description of the solution
* This app is a comics app where you can get comics from XKCD in your phone. With pressing buttons, you kan get the newest comic, the comic, the previous one, the next and also get a random comic. You can see the title, which number the comic are, which day, month and year it was published. If you longpress on the comic (Image) you get a littel alert box with the "alt" text. There is also a description button which take you to the new view where you see the description.
* It is possible to use the app in both landscape mode and portrait mode. 

## The thought process
* Because I use SwiftUI it was natural to use MVVM designpattern. As far as I know Apple switched from recommending MVC with UIKit to MVVM with SwiftUI. For me it makes sense because SwiftUI uses State and ObjectBinding (ObservableObject). In MVVM the View is aware of the ViewModel. The View informes teh ViewModel about User interractions, and when something changes in the the ViewModel, the View will know and updates the View. The ViewModel is aware of the Model, and interact with it by save and get data.
* In this project I started with the View and hardcoded some data. My first thought was to make a List (tableView in UIKit) of all the comics so the user could scroll through them. But I found out that this was a bad idea when I saw the api links, and changed it to use a plane View. 
* After that I made the Webservice struct where the urlSession and the decoding happens. Next I made the Model for the api. Next I made the fetchComics functions in the ViewModel that fetches the comics data into the VIewModel and saves it into the Model. After this I made the logic in the ViewModel to presenting the data in a understandable way for the View, and connected it To the View With @Published, ObservableObject in ViewModel and ObservedObject in the View. First i layed out the Title and the Comic image. To get the image to show I a had to make an extention to String where I first convert the image String to url. Then convert the url to data, and last create a UIImage from the data.
* Then a layed out the information about number, day, month and year.
* Next I made the buttons. I wanted to have most of the logit in the ViewModel, so I put the logic for the button there. 
* The app works in both light mode and dark mode, and to achieve that I made an extention to UIColor.
* I wanted the app to work in landscape mode as well as Portrait mode, så I used Environmet and sizeClass to differentiate the to modes.
* I saw i the XKCD webpage that you can se the "alt" text when you hoover over the comic image. I wanted the same effect, so I did so by making an alert that shows that text if you longPress the comic image.
* I also wanted to show the description (the transcript text if there are any). I made a button that uses a Navigation link to navigate to the Description View where you can read the description if the comic has one. To make this happen I had to use the NavigationView. This View also gives a nice Heading to the pages. I thought of using a sheet instead, but went with the navigation link. It might have given a better experience for the user with the sheet, but didn't have time to change in the end.  

## Highlight

## Links to sites I used as inspiration or borrowed code:
* Convert image string to UIImage:  https://www.youtube.com/watch?v=mPR-LB2tYUU
* How to make different background colors for dark mode and light mode: https://stackoverflow.com/questions/59694589/change-background-color-when-dark-mode-turns-on-in-swiftui

## Shortcuts that I didn't have time to fix
* Had to set the "Allow Arbitrary Loads" to "Yes" under "App Transport Security Settings" to get the api to work, because the api link is not https. I found out that this is not a good solution, but I couldn't get the "Exception Domains" to work so I could have the "Allow Arbitrary Loads" to "No"

## Bugs that I didn't have time to fix
* When you tilts your phone to landscape the app runs the api call for the latest comic
