import UIKit

// Task 1
func factorial(n: Int?) -> Int? {
    guard let number = n else {
        return nil
    }
    
    // negative
    guard number >= 0 else {
        print("Error: Factorial is not defined for negative numbers")
        return nil
    }
    
    // Base
    if number == 0 || number == 1 {
        return 1
    }
    
    // Recursive
    guard let result = factorial(n: number - 1) else {
        return nil
    }
    return number * result
}


if let result = factorial(n: 5) {
    print("Factorial of 5 is: \(result)")
}

if let result = factorial(n: 0) {
    print("Factorial of 0 is: \(result)")
}

if let result = factorial(n: -1) {
    print("Factorial of -1 is: \(result)")
}

if let result = factorial(n: nil) {
    print("Factorial of nil is: \(result)")
}

//Task 2

struct Student {
    let name: String
    let grades: [Double]
}

func averageGrade(for student: Student, inClass students: [String: Student]) -> Double {
    let sum = student.grades.reduce(0, +)
    return student.grades.isEmpty ? 0 : sum / Double(student.grades.count)
}

func bestStudent(for student: Student, inClass students: [String: Student]) -> (Student, Double) {
    let calculateAverage = { (student: Student) -> Double in
        student.grades.reduce(0, +) / Double(student.grades.count)
    }
    
    let best = students.values.max { calculateAverage($0) < calculateAverage($1) }
    return (best ?? student, calculateAverage(best ?? student))
}

let students = [
    "Alice": Student(name: "Alice", grades: [5.5, 3.5, 5.75]),
    "Bob": Student(name: "Bob", grades: [5.25, 3.75, 5.75])
]

let alice = students["Alice"]!
print(averageGrade(for: alice, inClass: students))
let (bestStud, bestAvg) = bestStudent(for: alice, inClass: students)
print("\(bestStud.name) has the best average: \(bestAvg)")


//Task3

func findLongestWord(in words: [String?]) -> String? {
    guard !words.isEmpty else {
        return nil
    }
    
    if words.count == 1 {
        return words[0]
    }
    
    let firstWord = words[0]
    let restLongest = findLongestWord(in: Array(words.dropFirst()))
    
    guard let first = firstWord, let rest = restLongest else {
        return firstWord ?? restLongest
    }
    
    return first.count >= rest.count ? first : rest
}

let words = ["Hi", "Lika", "iOS Developer", nil, "code"]
print(findLongestWord(in: words) ?? "No words found")


//Task 4

struct ShoppingItem {
    let name: String
    var quantity: Int
    var isPurchased: Bool = false
}

struct ShoppingList {
    private var items: [String: ShoppingItem] = [:]
    
    mutating func addItem(name: String, quantity: Int) {
        let item = ShoppingItem(name: name, quantity: quantity)
        items[name] = item
    }
    
    mutating func addItem(item: ShoppingItem) {
        items[item.name] = item
    }
    
    mutating func markAsPurchased(item: ShoppingItem) {
        var updatedItem = item
        updatedItem.isPurchased = true
        items[item.name] = updatedItem
    }
    
    mutating func markAsPurchased(itemName: String) {
        guard var item = items[itemName] else { return }
        item.isPurchased = true
        items[itemName] = item
    }
    
    func listUnpurchasedItems() -> [ShoppingItem] {
        return Array(items.values.filter { !$0.isPurchased })
    }
}

var shoppingList = ShoppingList()
shoppingList.addItem(name: "Apples", quantity: 5)
shoppingList.addItem(name: "Bananas", quantity: 3)
shoppingList.markAsPurchased(itemName: "Apples")
let unpurchased = shoppingList.listUnpurchasedItems()
print(unpurchased.map { $0.name })
