//
//  main.swift
//  onehundreddaysofswiftui
//
//  Created by Nguyen Anh Tuan on 05/03/2023.
//

import Cocoa

// check condition is true or false
var score = 10
if score >= 80 {
    print("Very good")
} else if score >= 60 {
    print("Normal")
} else {
    print("Bad")
}

let name1 = "A"
let name2 = "B"
if name1 > name2 {
    print("A > B")
}
if name1 < name2 {
    print("A < B")
}

let years = [2012, 2015, 2017, 2023]
if years.isEmpty {
    print("There are no years in the list")
} else {
    print("There are \(years.count) years in the list")
    if years.contains(2023) {
        print("2023 is in the list")
    }
    if years.contains(2012) || years.contains(2015) {
        print("2012 and 2015 also in the list")
    }
}

enum Level {
    case Amateur, Immediate, Advanced
}

let myLevel: Level = .Amateur
if myLevel == .Amateur {
    print("I am an amateur")
} else if myLevel == .Advanced {
    print("I am an advanced")
} else {
    print("I am an immediate")
}

// Switch
switch myLevel {
case .Advanced:
    print("Advanced")
case .Amateur:
    print("Amateur")
default:
    print("Immediate")
}

let day: Int = 5
print("My true love gave to me…")
switch day {
case 5:
    print("5 golden rings")
    fallthrough // means will also execute the next case
case 10:
    print("10 golden rings")
    fallthrough
default:
    print("A partridge in a pear tree")
}

let examResult = 6
switch examResult {
case 0:
    print("Super low")
case 1, 2, 3, 4, 5: // group multiple cases at once
    print("Low level")
case 6, 7, 8:
    print("Immediate")
default:
    print("Professional")
}

let isWeatherGood: Bool = true
let isChallengeOpen: Bool = false
switch (isWeatherGood, isChallengeOpen) { // multiple inputs
case (true, false):
    print("Weather is good but no challenge available")
case (false, true):
    print("Challenge available but weather doesn't seem to support us")
case (true, true):
    print("Well, lets do it")
default:
    print("Weather is not good and no challenge available")
}

// Ternary condition
let age: Int = 16
let isTeenager = age >= 13 && age <= 19
let isAdult = age > 19
let isChild = age < 13
print(isAdult ? "Adult" : "Not adult")
print(isAdult ? "Adult" : (isTeenager ? "Teenager" : "Child"))
