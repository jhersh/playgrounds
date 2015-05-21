//: Squine - noun: a [quine](https://en.wikipedia.org/wiki/Quine_(computing)) in Swift
import Cocoa
let quo = String(Character(UnicodeScalar(34)))
let com = String(Character(UnicodeScalar(44)))
let str = [
    "//: Squine - noun: a [quine](https://en.wikipedia.org/wiki/Quine_(computing)) in Swift",
    "import Cocoa",
    "let quo = String(Character(UnicodeScalar(34)))",
    "let com = String(Character(UnicodeScalar(44)))",
    "let str = [",
    "    ",
    "]",
    "for index in 0..<5 {",
    "    println(str[index])",
    "}",
    "for index in 0..<count(str) {",
    "    println(str[5] + quo + str[index] + quo + com)",
    "}",
    "for index in 6..<count(str) {",
    "    println(str[index])",
    "}",
]
for index in 0..<5 {
    println(str[index])
}
for index in 0..<count(str) {
    println(str[5] + quo + str[index] + quo + com)
}
for index in 6..<count(str) {
    println(str[index])
}