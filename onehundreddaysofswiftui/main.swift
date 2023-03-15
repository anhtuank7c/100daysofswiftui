//
//  main.swift
//  onehundreddaysofswiftui
//
//  Created by Nguyen Anh Tuan on 05/03/2023.
//

import Cocoa

// STRUCTS
struct Album {
    let title: String
    let artist: String
    let year: Int
    
    func printSummary() -> Void {
        print("\(title) - \(artist) - \(year)")
    }
}

let simplePlan = Album(title: "Welcome to my life", artist: "Simple Plan", year: 2009)
simplePlan.printSummary()

enum Department {
    case HR, IT, BOD
}
struct Employee {
    let name: String
    let department: Department
    var remainingDays: Int = 12
    
    mutating func takeVacationDays(days: Int) {
        if (remainingDays > days) {
            remainingDays -= days
            print("\(name) going on vacation")
            print("Day's remaining \(remainingDays)")
        } else {
            print("Oops! There aren't enough days remaining")
        }
    }
}

// need to use var keyword to declare a struct variable to be able to change the child data such as remainingDays
// if you declare struct data as a constant (let), Swift will makes the struct data constant, that's why you needed to use var keyword instead
var tuan = Employee(name: "Tuan", department: .IT, remainingDays: 12)
tuan.takeVacationDays(days: 10)
print(tuan.remainingDays)

// variables and constant belong to structs are called properties
// function belong to structs called method
// When create a constant or variable out of a struct, we call that an instance
// When create instances of structs, we do using an initializer of that struct such as Employee(name: "Tuan", department: .IT, remainingDays: 12)

// Swift silently creates a special function inside the struct called init(), using all the properties of the struct as its parameters
// it then automatically treats these two pieces of code as being the same:
var phuong = Employee(name: "Phuong", department: .HR, remainingDays: 12)
var phuong2 = Employee.init(name: "Phuong", department: .HR, remainingDays: 12)

// Swift siliently generate an initializer with a default value of 12 for remainingDays, so you don't need to pass value for that property
var phuong3 = Employee(name: "Phuong", department: .HR)
var phuong4 = Employee.init(name: "Phuong", department: .HR)


// COMPUTED PROPERTY
/**
 Swift can have 02 kinds of properties:
 - a stored property is a variable or constant that hold a piece of data inside an instance of the struct
 - a computed property calucates the value of the property dynamically every time it's accessed. (This means computed property are a blend of both stored properties and functions. they are accessed as a stored properties but work like functions)
 */
enum VacationError: Error {
    case outbound
}
struct User {
    let username: String
    let age: Int
    var vacationTaken = 0
    var vacationAllocated = 12
    
    // computed property vacationRemaining
    var vacationRemaining: Int {
        vacationAllocated - vacationTaken
    }
    
    // computed property with custom getter/setter functions
    var vacationRemaining2: Int {
        get {
            vacationAllocated - vacationTaken
        }
        
        set {
            vacationAllocated = vacationTaken + newValue // newValue provided by Swift, store whatever assigned to computed property
        }
    }
}

var nhi = User(username: "Nhi", age: 2)
nhi.vacationTaken += 10
nhi.vacationRemaining2 = 2 // 2 is newValue that assign to the computed property
print("Remaining vacation of \(nhi.username): \(nhi.vacationRemaining) \(nhi.vacationRemaining2)")

// PROPERTY OBSERVERS
/**
 Swift lets us create property observers, which are special pieces of code that run when properties change.
 These take 2 forms:
 - a didSet observer to run when the property just changed
 - a willSet observer to run before the property changed
 */
struct Game {
    var score = 0.0 {
        willSet {
            print("Current score is \(score)")
            print("New score will be \(newValue)")
        }
        didSet {
            print("Score is now \(score)")
            print("Old score is \(oldValue)")
        }
    }
    
    var histories = [Double]() {
        willSet {
            print("Current histories: \(histories.count), Next histories will be \(newValue.count)")
        }
        didSet {
            print("Histories is now \(histories.count), previous histories is \(oldValue.count)")
        }
    }
}
var game = Game()
game.score += 10
game.score += 20
game.histories.append(15.0)
game.histories.append(9.0)

// CREATE CUSTOM INITIALIZER

enum Rank {
    case Golden, Silver, Copper
}
struct Player {
    let name: String
    let rank: Rank
    
    // custom initializer
    init(name: String) {
        self.name = name
        self.rank = .Copper // we no longer take rank parameter, just assign a fixed value to this constant
    }
}

let player01 = Player(name: "Player 01")
print(player01)
