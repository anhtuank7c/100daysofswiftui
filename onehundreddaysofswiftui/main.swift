//
//  main.swift
//  onehundreddaysofswiftui
//
//  Created by Nguyen Anh Tuan on 05/03/2023.
//

import Cocoa

// ACCESS CONTROL

enum TransactionType {
    case DEPOSIT, SPENT, WITHDRAW
}

struct Transaction {
    let type: TransactionType
    let amount: Double
}

enum AccountStatus {
    case ACTIVATED, SUSPENDED, DEACTIVATED
}

// private means don't let anything outside of that struct to use this
// private(set) mean let anyone, anywhere get this but just let inside of that struct to set
// fileprivate means don't let anything outside of current file to use this
// public means let anyone, anywhere use this
struct BankAccount {
    private var funds: Double = 0.0
    private(set) var transactions = [Transaction]()
    public var status: AccountStatus = .ACTIVATED
    
    mutating func deposit(amount: Double) {
        transactions.append(Transaction(type: .DEPOSIT, amount: amount))
        funds += amount
        print("Deposit \(amount) successfully")
    }
    
    mutating func pay(amount: Double) -> Bool {
        if status != .ACTIVATED {
            print("Account has been \(status)")
            return false
        }
        if funds >= amount {
            transactions.append(Transaction(type: .SPENT, amount: amount))
            print("Pay \(amount) successfully")
            return true
        }
        print("Balance insufficient. Pay error.")
        return false
    }
    
    mutating func withdraw(amount: Double) -> Bool {
        if status != .ACTIVATED {
            print("Account has been \(status)")
            return false
        }
        if funds >= amount {
            transactions.append(Transaction(type: .WITHDRAW, amount: amount))
            print("Withdraw \(amount) successfully")
            return true
        }
        print("Balance insufficient. Withdraw error.")
        return false
    }
}

var tuanAcc = BankAccount()
tuanAcc.deposit(amount: 1000000)
tuanAcc.pay(amount: 20000)
print(tuanAcc.status)
tuanAcc.status = .SUSPENDED
tuanAcc.withdraw(amount: 9000000)
print(tuanAcc.transactions)
print(tuanAcc.status)

// STATIC PROPERTIES AND METHODS
/**
 static properties and static functions are access directly via struct name such as School.studentCount, School.add(student: "Tuan") without initialize any instance
 CAN acess static code from non-static code but CANNOT access non-static code from static code
 */
struct School {
    static var studentCount = 0
    static func add(student: String) {
        print("\(student) joined the school")
        studentCount += 1
    }
    
    func accessStaticProperties() {
        print("Number of student: \(School.studentCount) or \(Self.studentCount)") // can access static code from non-static code via struct name or Self
        // Self refer to struct itself but self refer current value of struct instance
    }
    
    func addStudent(student: String) {
        Self.add(student: student) // can access static code from non-static code
    }
}

School.add(student: "Tuan")
School.add(student: "Nhi")
print(School.studentCount)

var std01 = School()
std01.accessStaticProperties()
std01.addStudent(student: "Nhien")
std01.accessStaticProperties()
print(School.studentCount)

// static is useful in case we wan't to organize common data
struct Environment {
    static let endpoint: String = "https://example.com"
    static let version: String = "1.2"
}

// CHECKPOINT 6
/**
 Create a struct to store information about a car, including its model, number of seats, and current gear, then add a method to change gears up or down
 */
enum Gear {
    case P, N, D, S
}
struct Car {
    let model: String
    let numberOfSeats: Int

    private(set) var currentGear: Gear {
        willSet {
            print("Current gear \(currentGear)")
            print("New gear \(newValue)")
        }
        
        didSet {
            print("You have selected \(currentGear) gear")
            print("Previous gear is \(oldValue)")
        }
    }

    mutating func selectGear(gear: Gear) {
        currentGear = gear
    }
}

var hondaCRV = Car(model: "HONDA CRV", numberOfSeats: 7, currentGear: .P)
print(hondaCRV)
hondaCRV.selectGear(gear: .D)
print(hondaCRV)

var toyotaCross = Car(model: "Toyota Cross", numberOfSeats: 5, currentGear: .S)
print(toyotaCross)
toyotaCross.selectGear(gear: .N)
print(toyotaCross)
