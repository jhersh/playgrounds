//: A cheating [quine](https://en.wikipedia.org/wiki/Quine_(computing)) in Swift.
//: When executed, produces its own source code, including comments, as its only output.
//: This quine cheats by reading its own source from disk.

import Cocoa

if let data: NSData = NSFileManager.defaultManager().contentsAtPath(__FILE__),
    let contents = NSString(data: data, encoding: NSUTF8StringEncoding) {
    println("\(contents)")
}
