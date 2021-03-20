# Instant Comics app
## Specs
* Xcode 12.1
* Swift 5 and SwifUI
* iOS deployment target 14.1

## Description of the solution
* This app is a comics app where you can get comics from XKCD in your phone. With pressing buttons, you kan get the newest comic, the comic, the previous one, the next and also get a random comic. You can see the title, which number the comic are, which day, month and year it was published. If you longpress on the comic (Image) you get a littel alert box with the "alt" text. There is also a description button which take you to the new view where you see the description.
* It is possible to use the app in both landscape mode and portrait mode. 

## the thought process
*The app works in both dark mode and light mode

any points you'd like to highlight

## Links to sites I used as inspiration or borrowed code:
* Convert image string to UIImage:  https://www.youtube.com/watch?v=mPR-LB2tYUU
* How to make different background colors for dark mode and light mode: https://stackoverflow.com/questions/59694589/change-background-color-when-dark-mode-turns-on-in-swiftui

## Shortcuts that I didn't have time to fix
* Had to set the "Allow Arbitrary Loads" to "Yes" under "App Transport Security Settings" to get the api to work, because the api link is not https. I found out that this is not a good solution, but I couldn't get the "Exception Domains" to work so I could have the "Allow Arbitrary Loads" to "No"

## Bugs that I didn't have time to fix
* When you tilts your phone to landscape the app runs the api call for the latest comic
