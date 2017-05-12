# clean-panamera-ios

The main target of this repository is to have a clean approach for UIViewControllers Routing in a iOS app.
The objectives are:
- Abstract UIViewControllers from creating other UIViewControllers
- Delegate to another class what should be the next scene to show to the user
- Have a better way to develop User Interface in a work team instead of dealing with Storyboards merges

## What to do 
A primary object in an iOS project is UIViewController. They are in charge, generally, of doing all the necesary logic to show a functional interface to the user, and behaviour with events to its actions. Because of that, is common that in iOS projects they become larger files and called Massive View Controllers (ironically the really MVC)
With this information, we decided to test the Routing pattern. It consist in a "Router" object with the following behaviour:
- Is related to a certain flow (Ad, Profile, Search, Login, Posting, etc)
- Instantiates UIViewControllers from its own flow with the requested dependencies.
- Has the knowledge to show UIViewControllers, when and how to.
- Display embed UIViewControllers.
- Knows what to do when UIViewControllers inform that a navigation action was requested.

## Testing
A router is a view controller dependency, and conforms to a "Routeable" type protocol. If developer wants to test view controllers functionality, can be easily mocked, creating a "MockRouter" object that conforms the requested Routeable protocol. With this approach, view controllers depends from abstractions and not from specific implementations.

Further reading:
- https://medium.com/monitisemea/routing-with-mvvm-on-ios-f22d021ad2b2
- http://clean-swift.com/routing-in-clean-swift/
