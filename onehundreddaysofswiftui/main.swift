//
//  main.swift
//  onehundreddaysofswiftui
//
//  Created by Nguyen Anh Tuan on 05/03/2023.
//

import Cocoa

// Similar and different thing between Class and struct
/**
 // SIMILAR
 - You get to create and name then
 - you can add properties and methods, including property observers and access control
 - you can create custom initializer to configure new instance however you want
 
 // DIFFERENTS
 - You can make on class build upon functionality in another class, gaining all its properties and method as a starting point. If you want to selectively override some methods, you can do that too
 - Swift won't automatically generate a memberwise initializer for classes, you NEED to write your own initializer or assign default value to all your properties
 - when you copy an instance of a class. both share the same data.if you change one copy, other one also changes
 - when a final copy of a class instance is destroyed, Swift can OPTIONALLY run a special function called deinitializer
 - even if you make a class constant, you can still change its properties as long as they are variables
 */

class Game {
    var score = 0 {
        didSet {
            print("Score is now \(score)")
        }
    }
}

var newGame = Game()
newGame.score = 10

// class inherit
class Employee {
    let hours: Int
    init(hours: Int) {
        self.hours = hours
    }
    
    func printSummary() {
        print("I work \(hours) hours a day")
    }
}

class Developer: Employee {
    override func printSummary() {
        print("I am writing code for \(hours) hours")
    }
}
class Manager: Employee {
    override func printSummary() {
        print("I am going to meet \(hours) hours")
    }
}

let tuan = Developer(hours: 8)
tuan.printSummary()

let nhi = Manager(hours: 4)
nhi.printSummary()

// add initializer for classes

class Animal {
    let age: Int
    init(age: Int) {
        self.age = age
    }

    func speak() {
        print("Animal goes BipBip")
    }
}

class Cat: Animal {
    let name: String

    init(age: Int, name: String) {
        self.name = name
        super.init(age: age)
    }

    override func speak() {
        print("The cat \(name) goes Meo meo")
    }
}

class Dog: Animal {
    override func speak() {
        print("The dog goes Woff woff")
    }
}

let meow = Cat(age: 2, name: "Meow")
meow.speak()
let dog = Dog(age: 2)
dog.speak()

// copy classes
// In Swift, all copy of a class instance share the same data, meaning that any changes you make
// to one copy will automatically change other copies. (Different with struct)

class User {
    var name = "Anonymous"
    
    // If you want to copy, you need to handle create a new instance then assign current properties values to the new instance
    func copy() -> User {
        let user = User()
        user.name = name
        return user
    }
}

let user1 = User()
let user2 = user1.copy()
user2.name = "Taylor"
print(user1.name)
print(user2.name)

// deinitializer

class Car {
    var wheel: Int
    let numberPlate: String
    init(wheel: Int, numberPlate: String) {
        self.wheel = wheel
        self.numberPlate = numberPlate
        print("I am alive")
    }

    deinit {
        print("I am death")
    }
}

var cars = [Car]()
for i in 1...3 {
    let car = Car(wheel: i, numberPlate: "12A-123\(i)")
    print("Car \(car.wheel): I am in control")
    cars.append(car)
}
print("Loop is over")
cars.removeAll()
print("Array of cars is cleared")

// work with variables inside classes

let car = Car(wheel: 4, numberPlate: "30A-12312")
car.wheel = 5 // constant instance and variable properties can be change
// car.numberPlate = "22C-123123" // constant variable and constant property cannot be change

var car2 = Car(wheel: 7, numberPlate: "88A-99999")
car2.wheel = 5 // variable instance and variable properties can be change
// car2.numberPlate = "88A-88888" // variable instance and constant properties cannot be change

class A {
    let letter: String
    init(letter: String) {
        self.letter = letter
    }
}

// use final keywork to stop other subclassing from this class
final class B:A {
    func printMe() {
        print("Letter \(letter)")
    }
}

// class C: B {} class C cannot subclassing from B because class B is final

// CHECKPOINT 7
/**
Make a class hierarchy for animals, starting with Animal at the top, then Dog and Cat as subclasses, then Corgi and Poodle as subclasses of Dog, and Persian and Lion as subclasses of Cat.

But there’s more:
- The Animal class should have a legs integer property that tracks how many legs the animal has.
- The Dog class should have a speak() method that prints a generic dog barking string, but each of the subclasses should print something slightly different.
- The Cat class should have a matching speak() method, again with each subclass printing something different.
- The Cat class should have an isTame Boolean property, provided using an initializer.
 */
class CheckpointAnimal {
    let legs: Int
    init(legs: Int) {
        self.legs = legs
    }
}

class CheckpointDog: CheckpointAnimal {
    func speak() {
        print("The dog bark Woof Woof")
    }
}
class CheckpointCat: CheckpointAnimal {
    let isTame: Bool
    
    init(isTame: Bool, legs: Int) {
        self.isTame = isTame
        super.init(legs: legs)
    }

    func speak() {
        print("The cat scream Help help")
    }
}

final class Corgi: CheckpointDog {
    override func speak() {
        print("Corgi bark Oh yeah")
    }
}

final class Poodle: CheckpointDog {
    override func speak() {
        print("Poodle bark oach oach")
    }
}

final class Persian: CheckpointCat {
    override func speak() {
        print("Persian says meow meow")
    }
}

final class Lion: CheckpointCat {
    override func speak() {
        print("Lion cat says Raw raw")
    }
}

let corgi = Corgi(legs: 4)
corgi.speak()
let poodle = Poodle(legs: 4)
poodle.speak()
let persian = Persian(isTame: true, legs: 4)
persian.speak()
let lion = Lion(isTame: false, legs: 4)
lion.speak()
