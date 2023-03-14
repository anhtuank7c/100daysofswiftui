//
//  main.swift
//  onehundreddaysofswiftui
//
//  Created by Nguyen Anh Tuan on 05/03/2023.
//

import Cocoa

func greeting(name: String, age: Int) -> Void {
    print("Hello \(name). You're \(age) years old")
}

greeting(name: "Tuan", age: 34)

func rollDice(_ time: Int, _ range: Range<Int>) -> Int {
    var count = 0
    var result: Int = Int.random(in: range)
    while count <= time {
        result = Int.random(in: range)
        count += 1
    }
    return result
}

let firstTime = rollDice(3, Range<Int>(1...100))
print(firstTime)
let secondTime = rollDice(30, Range<Int>(1...100))
print(secondTime)

func getNames() -> [String] {
    return ["Tuan", "Nhi", "Nhien", "Phuong"]
}

func getUser(_ userId: String, name: String) -> [String: String] {
    return ["name": name, "userId": userId]
}
print(getNames())
print(getUser("123", name: "Tuan")["name", default: "No name"])

// tuple
var user: (String, Int) = ("Tuan", 34)
print(user.0)
print(user.1)

var user2: (firstName: String, lastName: String, age: Int) = (firstName: "Tuan", lastName: "Nguyen", age: 34)
print(user2.firstName)
print(user2.lastName)
print(user2.age)

// (data type, data type): tuple
func getUser2() -> (firstName: String, lastName: String) {
    return (firstName: "Tuan", lastName: "Nguyen")
}

// destructure a tuple
let (firstName, lastName) = getUser2()
print("Tuple \(firstName) \(lastName)")

func getUser3() -> (firstName2: String, lastName2: String) {
    return ("Tuan", "Nguyen") // don't need to repeat tuple key as getUser2
}

print(getUser3().firstName2)
print(getUser3().lastName2)

// can use _ to ignore other parts of Tuple while destructure
let (firstName2, _) = getUser3()
print(firstName2)

func hireEmployee(name: String) {}
func hireEmployee(title: String) {}
func hireEmployee(location: String) {}

// customize parameter label
// use underscore _ to hide external parameter name
func isUpperCase(_ input: String) -> Bool {
    input == input.uppercased()
}

let one = isUpperCase("one")

// use for|in for external parameter name
// name next to it is internal parameter name
func printTimeTable(for time: Int) -> Void {
    for i in 1...12 {
        print("\(i) x \(time) is \(i * time)")
    }
}

printTimeTable(for: 12)

func doSomethingStupid(in times: Int) -> Void {
    print("Do something stupid \(times)")
}

doSomethingStupid(in: 10)

// assign default value to parameter
func count(start: Int, end: Int = 10) {
    for i in start...end {
        print(i)
    }
}

count(start: 0)
count(start: 10, end: 20)

// handle errors in functions
enum PasswordError: Error {
    case short, obvious
}
func checkPassword(_ password: String) throws -> String {
    if password.count < 5 {
        throw PasswordError.short
    }
    if password == "12345" {
        throw PasswordError.obvious
    }
    if password.count < 8 {
        return "Ok"
    }
    if password.count < 10 {
        return "Good"
    }
    return "Excellent"
}

do {
    let result = try checkPassword("12345")
    print("Password: \(result)")
} catch PasswordError.short { // can catch every single exception
    print("Password is too short")
} catch {
    print("Error")
}

// the try! means you can use try without do-catch block but it will crash your code if have an Exception
// you should rarely use this
let result = try! checkPassword("12345ddasd")
print("Password: \(result)")

// CHECKPOINT 4
// write a function that accepts an integer from 1 through 10,000, and returns the integer square root of that number
enum ErrorSquareRoot: Error {
    case outbound, noroot
}

func findSquareRoot(of input: Int) throws -> Int {
    if input < 1 || input > 10_000 {
        throw ErrorSquareRoot.outbound
    }

    var sqrt: Int?
    for i in 1...100 {
        if i * i == input {
            sqrt = i
            break
        }
    }
    guard let sqrt = sqrt else {
        throw ErrorSquareRoot.noroot
    }
    return sqrt
}

do {
    let input = 10_000
    let sqrt = try findSquareRoot(of: input)
    print("Square root of \(input) is \(sqrt)")
} catch ErrorSquareRoot.outbound {
    print("Outbound exception")
} catch ErrorSquareRoot.noroot {
    print("No root exception")
} catch {
    print("Other exception")
}
