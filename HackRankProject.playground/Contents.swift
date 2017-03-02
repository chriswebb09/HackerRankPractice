//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

// ------------------------------------------------

var originalSentence = "Hello world"

var sentenceArray = originalSentence.components(separatedBy:  " ")
originalSentence = ""

sentenceArray.forEach { sentence in
    var newWord = sentence.characters.reversed().map { String($0) }
    originalSentence = "\(originalSentence)\(newWord.joined(separator: "")) "
}

print(originalSentence)


// ------------------------------------------------

var meal: Double? = Double(10.25)

var tip: Double? = Double(17)
var tax: Double? = Double(5)

guard let mealUnwrapped = meal, let tipUnwrapped = tip , let taxUnwrapped = tax else { fatalError() }

func calculateValue(paramValue: Double, mealValue: Double) -> Double {
    return mealValue * (paramValue / 100)
}

var calculatedTip = calculateValue(paramValue: tipUnwrapped, mealValue: mealUnwrapped)
var calculatedTax = calculateValue(paramValue: taxUnwrapped, mealValue: mealUnwrapped)
var calculatedMeal = round(mealUnwrapped + calculatedTip + calculatedTax)

// ------------------------------------------------

class Person {
    var age: Int = 0
    init (initialAge: Int) {
        self.age = initialAge
        if age < 0 {
            print("Age is not valid, setting age to 0.")
            self.age = 0
        } else {
            self.age = initialAge
        }
    }
    
    func amIOld () {
        if self.age < 13 {
            print("You are young.")
        } else if (age >=  13) && (age <= 17) {
            print("You are a teenager")
        } else if age > 17 {
            print("You are old.")
        }
    }
    
    func yearPasses() {
        self.age += 1
    }
}

func Time(time: Int, age: Int) {
    let t = Int(time)
    let age = Int(age)
    let p = Person(initialAge: age)
    for _ in 0...t {
        p.amIOld()
        p.yearPasses()
        print(p.age)
    }
}

var time = Time(time: 10, age: 12)

// ------------------------------------------------

func isPrime(number:Int) -> Bool {
    guard number > 2 else { return false }
    
    let max = Int(ceil(sqrt(Double(number))))
    
    for i in 2 ... max {
        if number % i == 0 {
            return false
        }
    }
    return true
}

isPrime(number: 11)

// ------------------------------------------------

func removeDuplicates(string:String) -> String {
    var checked = [Character: Bool]()
    let result = string.characters.filter { checked.updateValue(true, forKey: $0) == nil }
    return String(result)
}

removeDuplicates(string:"NOOOO")

// ------------------------------------------------

func condenseSpace(string:String) -> String {
    return string.replacingOccurrences(of: " ", with: "")
}
condenseSpace(string: "A BC")

// ------------------------------------------------

func permutations(input:String, builder: String = "") {
    var array = input.characters.map { $0 }
    var length = input.characters.count
    if length == 0 { print(builder) }
    for i in 0 ..< length {
        var lhs = String(array[0 ..< i])
        var rhs = String(array[i+1 ..< length])
        permutations(input: "\(lhs)\(rhs)", builder: builder + String(array[i]))
    }
}

// ------------------------------------------------

func pyramid(range : Int) {
    let p = 1...range
    var strings = ""
    var ntype = range
    for p in 1...range {
        strings = "#\(strings)"
        var spaces = ""
        for n in 1...ntype {
            if n == 1 { spaces = "\(spaces)" } else { spaces = " \(spaces)" }
        }
        ntype -= 1
        if p == range - 1 { print("\(spaces)\(strings)") } else { print("\(spaces)\(strings)") }
    }
}

pyramid(range: 4)

// ------------------------------------------------

func reverseString(string:String) {
    var stingArray = string.components(separatedBy: " ")
    var newString = ""
    stingArray.forEach {
        newString = "\($0) \(newString)"
    }
    print(newString)
}

// ------------------------------------------------

func isPrime(num:Int) -> Bool {
    guard num % 2 != 0 else { return false }
    for i in 2 ..< num {
        if num % i == 0 { return false }
    }
    return true
}

// ------------------------------------------------

func factorial(N:Int) -> Int {
    var intVal = N
    if intVal == 0 {
        return 1
    } else {
        return intVal * factorial(N: intVal - 1)
    }
}

print(factorial(N: 6))
isPrime(num: 27)
reverseString(string: "Hello dear")

// ------------------------------------------------

func test(length: Int, array:[Int]) {
    
    var positives = 0
    var negatives = 0
    var zeroes = 0
    
    for i in 0..<length {
        let num = array[i]
        if num > 0 {
            positives += 1
        } else if num == 0 {
            zeroes += 1
        } else if num < 0 {
            negatives += 1
        }
    }
    let numberOfInstances = [Double(positives), Double(zeroes), Double(negatives)]
    numberOfInstances.map { Double(100 * $0) / Double(100) / Double(length) }.map { print(String(format:"%.6f", $0)) }
}

test(length: 6, array: [1,0,3,-4,-5,6])

// ------------------------------------------------

var input = String(readLine()!)
var pattern = "ABC*D".replacingOccurrences(of: "*", with: ".")
let regex = try NSRegularExpression(pattern: pattern, options: [])

var check = regex.matches(in: input!, options: [], range: NSRange(location: 0, length: input!.characters.count)).map { $0.numberOfRanges }.count

// ------------------------------------------------

struct EntryStruct {
    var name: [String]
    var id: String
}

var separateSocial = records.flatMap { [$0.components(separatedBy: ":")] }.map { $0 }
var separateName = separateSocial.flatMap { EntryStruct(name: $0.first!.components(separatedBy: ","), id: $0.last!)}
var ids = [String]()
var updatedEntries = [EntryStruct]()

func addToRecords(record:EntryStruct) {
    if !ids.contains(record.id) {
        ids.append(record.id)
        updatedEntries.append(record)
    }
}

func checkEntry() {
    let sortedArray = separateName.sorted {
        $0.id >= $1.id
    }
    let test = sortedArray.sorted { $0.name[0] <= $1.name[0] }
    test.forEach {
        if ($0.name[0].components(separatedBy: " ").count >= 3) && $0.name[0].components(separatedBy: ".").count <= 1 {
            addToRecords(record: $0)
        }
        if $0.name[0].components(separatedBy: " ").count == 2 && !ids.contains($0.id) && $0.name[0].components(separatedBy: ".").count <= 1 {
            addToRecords(record: $0)
        }
    }
    test.forEach {
        if $0.name.count == 1 {
            addToRecords(record: $0)
        }
    }
    updatedEntries.forEach {
        print("\($0.name[0]):\($0.id)")
    }
}

checkEntry()
