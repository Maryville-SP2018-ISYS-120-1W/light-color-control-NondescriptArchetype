# Week 3 Lecture Development Example: Light Color Controller

### Lecture Development Examples Overview

The purpose of lecture development examples is for you, the instructor, to have a finished application that is appropriate for you to build in class. This repository is the finished product. The expectation is that you would construct this, from scratch, with the students.

It is recommended you show them the finished product first that. This establishes the goal of what you will build. Additionally, the context of the application should also be established (e.g., this is for someone who trades bitcoins).

### App Context
There are many new home automation schemes that enable control of devices from your phone or tablet. One such device are so-called smart lightbulbs whose color is changeable by an app (e.g., Philips Hue). Our app is one such example of this, but it relies upon giving the color by a number: the hue of the color. So given a number between 0 and 360, this will correspond to the hue value of the [HSV color wheel](https://i.stack.imgur.com/BfTXY.png). The app will show us the color, and give us the color's name, when we switch on the bulb.

This example is intended for after you have discussed control flow with if statements and switch statements (through section 1.4 of App Development with Swift). You should have also discussed [guard statements](https://www.programiz.com/swift-programming/guard). Scaffolding is necessary for [HSV color representation](http://learn.leighcotnoir.com/artspeak/elements-color/hue-value-saturation/) as our light color chooser depends upon entering a hue value and translating that into a [UIColor object](https://developer.apple.com/documentation/uikit/uicolor) with that hue value.


### Learning Points

It is critical when developing this app with students that you layout the big picture tasks first. What is it that this app has to do when we have a valid value for the hue to turn on the bulb?

1. Set the background to the Color
2. Display the name of the color in the name box
3. Set the color of the name box to a less saturated, less bright color of the same hue

And these steps should be broken down accordingly until we are able to translate the big picture algorithmic steps into actual instructions. This will lead to the need to convert the text in the hue box to a floating point value as an additional part.

* What should the app do if there is no text value? It should not turn on the light.
* What should the app do if the text value is not a valid hue value (i.e., "asdf")? It should not turn on the light.

It should also be noted we're writing a lot of code in one function. This is generally bad style. We will later see how we can clarify this work and make it correspond more to how we think about the subtasks of solving this problem using functions.
