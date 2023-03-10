//
//  main.swift
//  onehundreddaysofswiftui
//
//  Created by Nguyen Anh Tuan on 05/03/2023.
//

import Cocoa

// Type annotation

let name: String = "Tuan"
let age: Int = 34
let secureTextEntry: Bool = true
let temperature: Double = 26.8
let salary: Float = 0.1231231

var names: [String] = [String]()
names.append("Tuan")
names.append("Simon")
names.append("Adam")
names.append("Elin")

var ages = [Int]()
ages.append(20)
ages.append(22)
ages.append(7)
ages.append(2)
ages.append(34)
ages.append(59)

var seagames: Set<String> = Set<String>()
seagames.insert("2000")
seagames.insert("2004")
seagames.insert("2008")
seagames.insert("2012")
seagames.insert("2016")
seagames.insert("2020")
seagames.insert("2024")

var mustVisitPlaces: [String: String] = [String: String]()
mustVisitPlaces["Top_1"] = "HaLong Bay"
mustVisitPlaces["Top_2"] = "Da Lat"
mustVisitPlaces["Top_3"] = "Nha Trang"
mustVisitPlaces["Top_4"] = "Quy Nhon"
mustVisitPlaces["Top_5"] = "Sapa"

enum PRNDS {
    case P, R, N, D, S
}

var gearStickPosition: PRNDS = PRNDS.P
gearStickPosition = .D


// CHECKPOINT 2

// create an array of string
let locations: [String] = ["Quang Ninh", "Yen Bai", "Ha Noi", "Ho Chi Minh", "Ha Noi", "Hai Phong", "Da Lat"]

// print the number of items
print("Locations count \(locations.count)")

// print the number of unique items
let uniqueLocations = Set(locations)
print("Unique locations count \(uniqueLocations.count)")
