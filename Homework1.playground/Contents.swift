import UIKit
//Task 1: Practice Loops

// Solution 1
print("Using for in loop:")
for number in 1...10 {
    let evenOdd = number % 2 == 0 ? "Even" : "Odd"
    print("\(number) \(evenOdd)")
}

// Solution 2
print("\nUsing while loop:")
var counter = 1
while counter <= 10 {
    let evenOdd = counter % 2 == 0 ? "Even" : "Odd"
    print("\(counter) \(evenOdd)")
    counter += 1
}

// Solution 3
print("\nUsing repeat while loop:")
var count = 1
repeat {
    let evenOdd = count % 2 == 0 ? "Even" : "Odd"
    print("\(count) \(evenOdd)")
    count += 1
} while count <= 10

//Task 2: Working With Arrays

var tvSeries = ["Breaking Bad", "Friends", "The Office", "Stranger Things",
                "Severance", "Game of Thrones", "The Crown", "Better Call Saul",
                "Black Mirror", "The Wire"]

for (index, show) in tvSeries.enumerated() {
    if index % 3 == 0 {
        print("\(index): \(show.uppercased())")
    } else if index % 4 == 0 {
        let capitalizedWords = show.split(separator: " ")
            .map { $0.capitalized }
            .joined(separator: " ")
        print("\(index): \(capitalizedWords)")
    } else {
        print("\(index): \(show)")
    }
}

// Extra
tvSeries.append("Ted Lasso")
print("\nUpdated list:")
tvSeries.forEach { print($0) }

//Task 3: Grade Tracker

var grades = ["Alice": 85, "Bob": 90, "Charlie": 78]

print("\nAll students and grades:")
for (student, grade) in grades {
    print("\(student): \(grade)")
}

// Add new student
grades["Lika"] = 95
print("\nAfter adding new student:")
for (student, grade) in grades {
    print("\(student): \(grade)")
}

// Find specific student's grade
let studentName = "Lika"
if let grade = grades[studentName] {
    print("\n\(studentName)'s grade: \(grade)")
}

//Task 4: Person Details

var person = (name: "Lika Nozadze", age: 30, city: "Tbilisi")

print("\nPerson Details")
print("Name: \(person.name)")
print("Age: \(person.age)")
print("City: \(person.city)")

// Extra task: Update city
person.city = "Los Angeles"
print("\nUpdated Person Details:")
print(person)

//Task 5: Shopping List

let shoppingList: [(item: String, price: Double)] = [
    ("Milk", 3.99),
    ("Wine", 9.99),
    ("Cheese", 5.99),
    ("Bacon", 4.99),
    ("Bananas", 2.99)
]

print("\nShopping List:")
var totalCost = 0.0

for item in shoppingList {
    print("\(item.item): $\(item.price)")
    totalCost += item.price
}

print("Total cost: $\(String(format: "%.2f", totalCost))")
