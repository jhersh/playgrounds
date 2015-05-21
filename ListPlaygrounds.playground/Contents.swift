// List all playground projects' comments in the current working folder.
// Pulls out comments starting from the first line in the file until a non-comment line
// is encountered.

import Cocoa

extension String {
    private static let commentCharacters = NSCharacterSet(charactersInString: "/*: ")
    
    func isCommentLine() -> Bool {
        return count(self) > 0 && String.commentCharacters.characterIsMember((self as NSString).characterAtIndex(0))
    }
    
    func commentText() -> String? {
        if let textRange = rangeOfCharacterFromSet(String.commentCharacters.invertedSet, options: .LiteralSearch, range: nil) {
            return substringFromIndex(textRange.startIndex)
        }
        
        return nil
    }
}

struct Playground {
    let filePath: String
    let nonCommentCharacters = NSCharacterSet(charactersInString: "/*: ").invertedSet
    
    init(path: String) {
        self.filePath = path
    }
    
    static func pathIsPlayground(path: String) -> Bool {
        return path.hasSuffix(".playground")
    }
    
    func playgroundName() -> String {
        return filter(split(self.filePath, maxSplit: 0, allowEmptySlices: true, isSeparator: {
            (bit: Character) -> Bool in
            return bit == "/"
        }), {
            (item: String) -> Bool in
            return item.hasSuffix(".playground")
        }).first ?? ""
    }
    
    func headerDesc() -> String? {
        if let data = NSFileManager.defaultManager().contentsAtPath(filePath.stringByAppendingPathComponent("Contents.swift")),
            let contents = NSString(data: data, encoding: NSUTF8StringEncoding) {
                
                var desc = ""
                
                contents.enumerateLinesUsingBlock { (line, stop) in
                    if line.isCommentLine(),
                        let text = line.commentText() {
                        desc += text + " "
                    } else {
                        stop.initialize(true)
                    }
                }

                return desc.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet())
        }
        
        return nil
    }
}

let fileManager = NSFileManager.defaultManager()
var description = ""

if let enumerator = fileManager.enumeratorAtPath(fileManager.currentDirectoryPath) {
    while let file = enumerator.nextObject() as? String {
        if Playground.pathIsPlayground(file) {
            let playground = Playground(path: file)
            description += "### " + playground.playgroundName() + "\n"
            description += (playground.headerDesc() ?? "") + "\n\n"
            description += "Run it: `xcrun swift /path/to/\(playground.playgroundName())/Contents.swift`\n\n"
        }
    }
}

println("\(description)")
