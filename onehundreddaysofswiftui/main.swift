//
//  main.swift
//  onehundreddaysofswiftui
//
//  Created by Nguyen Anh Tuan on 05/03/2023.
//

import Cocoa

// var keyword mean this variable able to declare with or without initial value, able to reassign multiple times
var greeting = "Hello world"
greeting = "100 days of SwiftUI"
print(greeting) // 100 days of SwiftUI

// let keyword mean this is a constant, must have initial value and NOT able to reassign it
let location = "Halong Bay"
print(location)

// String
let name1 = """
A day
in the life
of
an
unemployment
Software
Engineer
"""

let quote = "I want to emphasize \"I am not perfect\" but I do \"improve\" myself everyday"
print(name1)
print(quote)

let quoteWithEmoji = "I never lose my character 🥰"
print(quoteWithEmoji)

print("quoteWithEmoji has \(quoteWithEmoji.count) characters")
print(quoteWithEmoji.uppercased())

print("quoteWithEmoji has prefix I??? \(quoteWithEmoji.hasPrefix("I"))")
print("quoteWithEmoji has suffix 🥰??? \(quoteWithEmoji.hasSuffix("🥰"))")

// concat string

let people = "Haters"
let action = "hate"
let lyric1 = people + " gonna " + action
let lyric2 = "\(people) gonna \(action)"
let luggageCode = "1" + "2" + "3" + "4" // inefficient way by concat 12 then 123 and then 1234.
let days = 12
let missionMessage = "Mission will be started in \(days) days" // string interpolation is an efficient way to concat strings
let eggs = 20
let additionEggs = 5
let total = "You have \(eggs + additionEggs) in total" // You have 25 in total

// Swift is case-sensitive language
var ten: Int = 10
var TEN: String = "10"
var Ten: Double = 10.0

// Integer
let score = 10
let reallyBig = 1_00_000_000_000 // stand for 100000000000 but in nicer format
let lowerScore = score - 2
let higherScore = score + 10
let doubleScore = score * 2
let squaredScore = score * score
let halveScore = score / 2

var counter = 10
counter = counter + 5 // 15
counter += 5 // 20

counter = counter * 2 // 40
counter *= 2 // 80

print(counter.isMultiple(of: 40))

counter = counter - 10 // 70
counter -= 10 // 60

counter = counter / 2 // 30
counter /= 2 // 15

// Decimal

let complexNumber = 0.1 + 0.2 // 0.30000000000000004
print("complexNumber \(complexNumber)")

let numberA = 10 // Int
let numberB = 10.1 // Double
let numberC = Double(numberA) + numberB // Swift does not allowed us to mix different data types. Needed to cast to the same data types
let numberD = 10.0 // Double
let numberE: Double = 10
print(numberE) // 10.0

// There is an older APIs use slightly different way of storing descimal number such as CGFloat.
// Fortunately Swift lets us use regular Double everywhere a CGFloat is expected so we can safely ignore it

// Boolean

let amIWeak = false
let amIStrong = true
let isMultiple = 120.isMultiple(of: 3) // true

var doYouGotAContract = true // true
doYouGotAContract = !doYouGotAContract // false

var doYouGiveUp = true
doYouGiveUp.toggle() // false


// CHECKPOINT 01
/**
 Requirements:
 1. Creates a constant holding any temperature in Celsius.
 2. Converts it to Fahrenheit by multiplying by 9, dividing by 5, then adding 32.
 3. Prints the result for the user, showing both the Celsius and Fahrenheit values.
 */

// 1. Creates a constant holding any temperature in Celsius.
let temperatureInCelsius = 27.0

// 2. Converts it to Fahrenheit by multiplying by 9, dividing by 5, then adding 32.
let temperatureInFahrenheit = (temperatureInCelsius * 9 / 5) + 32 // I found this technical isn't correct

// 3. Prints the result for the user, showing both the Celsius and Fahrenheit values.
print("Current temperture: \(temperatureInCelsius)°C, equivalent to \(temperatureInFahrenheit)°F")

// Array

var beatles = ["John", "Paul", "George", "Ringo"]
let numbers = [1, 2, 3, 4, 5]
let temperatures = [22.0, 24.5, 26.2, 25.8, 18.0, 9, 30.1]
print(beatles[0])
print(numbers[2])
print(temperatures[4])

beatles.append("Tuan")
beatles.append("Elin")
beatles.append("Hadrien")
beatles.append("Leon")
beatles.append("Adam")
beatles.append("Simon")
beatles.append("Duong")
print("Beatles member: \(beatles.count)")
beatles.remove(at: 1)
print("Beatles member: \(beatles.count)")
print(beatles)
let reversedBeatles = beatles.reversed()
print(reversedBeatles)
print(reversedBeatles.sorted())

// temperatures.append("String") Swift ensure that array contains one data type at the time

var anEmptyArray = Array<Int>()
anEmptyArray.append(10)
anEmptyArray.append(20)

var albums = [String]()
albums.append("Adele")
albums.append("Blue")
albums.append("Simple Plan")

var characters = ["Lana"] // Swift can infer the data type by initial value. [String] for this example

print("temperatures: \(temperatures)")

// find all the element that greater than 20
let filteredTemperatures = temperatures.filter { $0 > 20 }
print("temperature greater than 20: \(filteredTemperatures)")

let temperatureLowToHigh = temperatures.sorted()
print("temperatureLowToHigh: \(temperatureLowToHigh)")

let temperatureHighToLow = temperatureLowToHigh.sorted { $0 > $1 }
print("temperatureHighToLow: \(temperatureHighToLow)")

let totalTemperature = temperatures.reduce(0) { partialResult, temp in
    return partialResult + temp
}
print("totalTemperature: \(totalTemperature)")

// Dictionary

let person = ["name": "Tuan", "age": "34", "job": "jobless"]
print(person["name"])

let hasGraduated = [
    "Tuan": true,
    "Duong": true,
    "Nhi": false
]

var olympics = [
    2012: "London",
    2016: "Rio de Janeiro",
    2021: "Tokyo"
]
var heights = [String: Int]()
heights["Yao Ming"] = 229
heights["LeBron James"] = 206

print(heights["Yao Ming", default: 0])
print(heights["No exist key", default: 0])

print(olympics)
// return an ordered array
let orderedByKey = olympics.sorted { r1, r2 in
    return r1.key > r2.key
}
print(orderedByKey)
print(orderedByKey[0].key)
print(orderedByKey[0].value)
olympics.removeValue(forKey: 2016)
print(olympics)
// override value of a key
olympics[2021] = "Vietnam"
print(olympics)

// Set
// the main different between Set and Array is Set can't store duplicated data and Set store data in optimized order that make it very fast to locate items.

var years = Set([2007, 2011, 2013, 2017, 2018, 2023])
print(years)
years.insert(2007) // can't store duplicated data, the previous one will be overrided by the new one
print(years)

var employee = Set<String>()
employee.insert("Tuan")
employee.insert("Simon")
employee.insert("Duong")
employee.insert("Anh")
print(employee)
print("Have Tuan? \(employee.contains("Tuan"))") // advantage of Set compare to Array
let orderedSet = employee.sorted()
print(orderedSet)
let orderedSet2 = employee.sorted { $0 > $1 }
print(orderedSet2)
print(orderedSet2.count)

// Enum

enum Weekday {
    case monday
    case tuesday
    case wednesday
    case thurday
    case friday
}
var day = Weekday.monday
print(day)
day = .friday
print(day)

enum Response {
    case success, failed, internal_error
}

var response: Response = .failed
response = .success

print(response)
