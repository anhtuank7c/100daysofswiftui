//
//  main.swift
//  onehundreddaysofswiftui
//
//  Created by Nguyen Anh Tuan on 05/03/2023.
//

import Cocoa

// CLOSURE
let greeting: () -> Void = { // closure
    print("Hi there")
}

greeting()

let greetingTwo: (String) -> String = { (name: String) -> String in // closure with parameter
    "Hi \(name)"
}

print(greetingTwo("Tuan"))

let greetingThree = { (name: String, age: Int) -> String in // closure with parameter
    "Hi \(name), you're \(age) years old"
}
print(greetingThree("Tuan", 34))

let names = ["Tuan", "Nhi", "Phuong", "Nhien", "Duong"]

let sortedNames = names.sorted(by:{ (name1: String, name2: String) -> Bool in // closure with 02 parameters
    if name1 == "Nhien" {
        return true
    }
    if name2 == "Nhien" {
        return false
    }
    return name1 > name2
})
print(sortedNames) // ["Nhien", "Tuan", "Phuong", "Nhi", "Duong"]

// trailing closure syntax
// Remove the by: and parenthesis, just go into closure directly

// shorthand parameter names
// (name1: String, name2: String)
// $0 stand for parameter name1 at index 0
// $1 stand for parameter name2 at index 1
// recommend doing this only under some conditions.

let sortedNames2 = names.sorted {
    if $0 == "Nhien" {
        return true
    }
    if $1 == "Nhien" {
        return false
    }
    return $0 > $1
}

print(sortedNames2) // ["Nhien", "Tuan", "Phuong", "Nhi", "Duong"]

// even shorter
let uppercaseNames = names.map { $0.uppercased() }
print(uppercaseNames) // ["TUAN", "NHI", "PHUONG", "NHIEN", "DUONG"]

// ACCEPT FUNCTIONS AS PARAMETERS
func makeArray(
    sizes: Int,
    using generate: () -> Int,
    alsoPrint printOut: (String) -> Void,
    finally logs: () -> Void
) -> [Int] {
    var result = [Int]()
    for _ in 0...sizes {
        let num = generate()
        result.append(num)
        printOut("Generated \(num)")
    }
    logs()
    return result
}

// calling function and passing multiple closures
let arr = makeArray(sizes: 10) {
    Int.random(in: 1...200)
} alsoPrint: {
    print($0)
} finally: {
    print("Finally done")
}

print(arr)

// CHECKPOINT 5
/**
 - Filter out any numbers that are even
 - Sort the array in ascending order
 - Map them to strings in the format “7 is a lucky number”
 - Print the resulting array, one item per line
 */
let luckyNumbers = [7, 4, 38, 21, 16, 15, 12, 33, 31, 49]
print(luckyNumbers)

let processedLuckyNumbers = luckyNumbers
    .filter { !$0.isMultiple(of: 2) } // Filter out any numbers that are even
    .sorted { $0 < $1 } // Sort the array in ascending order
    .map { "\($0) is a lucky number"} // Map them to strings in the format “7 is a lucky number”

processedLuckyNumbers.forEach { print($0) } // Print the resulting array, one item per line
