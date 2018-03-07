# Move

![Language](https://img.shields.io/badge/Language-Swift-orange.svg)
![Version](https://img.shields.io/badge/version-1.0.0-blue.svg)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)

Move is a framework to make easier all navigations between view controllers. It has been developed mainly to help in projects where the Navigation layer is not in the View Controller.

## Installation

### Carthage

[Carthage](https://github.com/Carthage/Carthage) is a decentralized dependency manager that builds your dependencies and provides you with binary frameworks. Add this line to your Cartfile.

```
github "jcarlosestela/move-ios" ~> 0.1
```

### CocoaPods

[Cocoapods](https://cocoapods.org) is a dependency manager for Cocoa projects. 
Add this line to your Podfile.

```
pod "Move" ~> 0.1
```

## Usage

First of all, it is important to know that **ALL** navigations have to be implemented with **Move** to obtain a correct behaviour.

In your appDidLaunch of your AppDelegate you have to define what is your initial view controller of your application by adding:

```swift
func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
	let viewController = ...
	Move.toInitial(viewController: viewController)
}
```

Then, if you want to perform any navigation to other ViewController, just add the following code:

```swift
Move.to(viewController: viewController, type: .modal)
Move.to(viewController: viewController, type: .push)
```

To go back to the previous viewcontroller:

```swift
Move.back()
```

## Helpers

The SDK provides some helpers to instantiate a ViewController from StoryBoard or Xib easier:

### Storyboard & Xib

You have to conform the protocol StoryboardInstantiable or the XibInstantiable for this purpose.

If you want to instantiate the view controller and add some context data:

```swift
let viewController = FirstViewController.fromStoryBoard()
let viewController = FirstViewController.fromStoryXib()
viewControler.data = ...
Move.to(viewController: viewController, type: .push)
```

If you just want to move to the view controller without adding data:

```swift
Move.to(viewController: FirstViewController.self, type: .push)
```