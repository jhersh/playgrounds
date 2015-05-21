# Playgrounds [![Circle CI](https://circleci.com/gh/jhersh/playgrounds.svg?style=svg)](https://circleci.com/gh/jhersh/playgrounds)

A collection of fun Swifty playgrounds. 

In fact, the below list of playgrounds was itself generated by `ListPlaygrounds.playground`! After each commit, [CircleCI](https://circleci.com/gh/jhersh/playgrounds) updates this file, `readme.md`.

## Playground List
### CheatingQuine.playground
A cheating quine (https://en.wikipedia.org/wiki/Quine_(computing)) in Swift When executed, produces its own source code, including comments, as its only output. This quine cheats by reading its own source from disk.

Run it: `xcrun swift /path/to/CheatingQuine.playground/Contents.swift`

### ListPlaygrounds.playground
List all playground projects' comments in the current working folder. Pulls out comments starting from the first line in the file until a non-comment line is encountered.

Run it: `xcrun swift /path/to/ListPlaygrounds.playground/Contents.swift`

### Squine.playground
Squine - noun: a [quine](https://en.wikipedia.org/wiki/Quine_(computing)) in Swift import Cocoa let quo = String(Character(UnicodeScalar(34))) let com = String(Character(UnicodeScalar(44))) let str = [ "//: Squine - noun: a [quine](https://en.wikipedia.org/wiki/Quine_(computing)) in Swift", "import Cocoa", "let quo = String(Character(UnicodeScalar(34)))", "let com = String(Character(UnicodeScalar(44)))", "let str = [", "    ", "]", "for index in 0..<5 {", "    println(str[index])", "}", "for index in 0..<count(str) {", "    println(str[5] + quo + str[index] + quo + com)", "}", "for index in 6..<count(str) {", "    println(str[index])", "}", ] for index in 0..<5 { println(str[index]) } for index in 0..<count(str) { println(str[5] + quo + str[index] + quo + com) } for index in 6..<count(str) { println(str[index]) }

Run it: `xcrun swift /path/to/Squine.playground/Contents.swift`

### SwiftSpace.playground
Strip trailing whitespace from all `.h`, `.m`, and `.swift` source files in the current directory and recursive subdirectories.

Run it: `xcrun swift /path/to/SwiftSpace.playground/Contents.swift`

