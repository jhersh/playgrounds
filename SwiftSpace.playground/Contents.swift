// Strip trailing whitespace from all .h, .m, and .swift source files in the current directory
// and recursive subdirectories.

import Cocoa

let sourceExtensions = [ "h", "m", "swift" ]
let fileManager = NSFileManager.defaultManager()

extension String {
    func stripTrailingWhitespace() -> String {
        if let range = rangeOfCharacterFromSet(NSCharacterSet.whitespaceCharacterSet().invertedSet,
            options: .BackwardsSearch, range: nil) {
            return substringToIndex(range.endIndex)
        } else {
            return substringToIndex(startIndex)
        }
    }
}

func stripTrailingWhitespace(#file: String) {
    if let data = fileManager.contentsAtPath(file),
        let contents = NSString(data: data, encoding: NSUTF8StringEncoding),
        var lines = contents.componentsSeparatedByCharactersInSet(NSCharacterSet.newlineCharacterSet()) as? [String] {

        lines = lines.map { $0.stripTrailingWhitespace() }

        if let data = ("\n".join(lines) as NSString).dataUsingEncoding(NSUTF8StringEncoding) {
            if !data.writeToFile(file, atomically: true) {
                fatalError("Failed writing to \(file)")
            }
        }
    }
}

let directory = fileManager.currentDirectoryPath
let enumerator = fileManager.enumeratorAtPath(directory)

var files = 0
var sourceFiles = 0

while let file = enumerator?.nextObject() as? String {
    files++
    var isDirectory = ObjCBool(false)
    if fileManager.fileExistsAtPath(file, isDirectory: &isDirectory) {
        if !isDirectory.boolValue,
            let ext = (file.lowercaseString as NSString).componentsSeparatedByString(".").last as? String {

            if contains(sourceExtensions, ext) {
                sourceFiles++
                stripTrailingWhitespace(file: file)
            }
        }
    }
}

println("Evaluated \(sourceFiles) source files of \(files) total file(s) in \(directory).")
