//
//  main.swift
//  onehundreddaysofswiftui
//
//  Created by Nguyen Anh Tuan on 05/03/2023.
//

import Cocoa

// combine more compare condition to if-else
let grantedPermission = true
let authorized = true
if grantedPermission, authorized {
    print("You have authorized and have the right permission_1")
}
if grantedPermission && authorized {
    print("You have authorized and have the right permission_2")
}

// for loop
let platforms = ["iOS", "macOS", "tvOS", "ipadOS", "watchOS"]
for os in platforms {
    print("Swift work great on \(os)")
}

let developerEquipments = Set<String>(["phone", "computer", "smart watch", "camera"])
for equipment in developerEquipments {
    print(equipment.uppercased())
}

let persons: [[String: String]] = [["name": "Tuan"], ["name": "Nhi"], ["name": "Nhien"], ["name": "Phuong"]]
for person in persons {
    for key in person.keys {
        print("\(key): \(person[key])")
    }
}

// x ... y means an integer range
for i in 1 ... 10 {
    print(i)
}

// x ..< y means an integer range start at x and less than y
for i in 1 ..< 10 {
    print(i)
}

for _ in 1 ... 3 {
    print("Hello world. I don't care about loop variable so I used _ to ignore it")
}

enum Role {
    case Guess, Authenticated, Moderator, Administrator
}

// while loop
var countdown = 10
while countdown > 0 {
    print(countdown)
    countdown -= 1
}

let id = Int.random(in: 1...100)
let amount = Double.random(in: 1...100)

var roll = 0
while roll != 20 {
    roll = Int.random(in: 1...100)
    print("I rolled a \(roll)")
}

// repeat-while loop
var roll2 = 0
repeat {
    roll2 = Int.random(in: 0...10)
    print("I rolled2 a \(roll2)")
} while roll2 != 5

// Array, Set built-in forEach loop
let languages = ["English", "Vietnamese", "Swedish", "French"]
languages.forEach { language in
    print(language)
}

let setLanguages = Set(languages)
setLanguages.forEach { language in
    print(language)
}

// break loop
for i in 1...10_000_000 {
    print("Loop \(i)")
    if (i > 5) {
        print("Break it now")
        break // break the loop
    }
}

let files = ["image.jpg", "image.jpeg", "image.png", "image.webp", "image.gift", "image.bmp"]
for file in files {
    if (file.hasSuffix("webp") == false) {
        print("\(file) does not match")
        continue
    }
    print("Found \(file) but the loop doesn't stop yet")
}

var counter = 0
while true {
    counter += 1
    print("Counter \(counter)")
    if (counter == 3) {
        print("Break while")
        break
    }
}

repeat {
    counter += 1
    print("Repeat counter \(counter)")
    if (counter == 5) {
        print("Break repeat-while at \(counter)")
        break
    }
} while true

// CHECKPOINT 3

/**
 Loop 1 to 100 and for each number:
 - If it’s a multiple of 3, print “Fizz”
 - If it’s a multiple of 5, print “Buzz”
 - If it’s a multiple of 3 and 5, print “FizzBuzz”
 - Otherwise, just print the number
 */

print("CHECKPOINT 3")

for i in 1...100 {
    if i.isMultiple(of: 3) || i.isMultiple(of: 5) {
        if i.isMultiple(of: 3) {
            print("Fizz")
        }
        if i.isMultiple(of: 5) {
            print("Buzz")
        }
        if i.isMultiple(of: 3), i.isMultiple(of: 5) {
            print("FizzBuzz")
        }
    } else {
        print(i)
    }

}
