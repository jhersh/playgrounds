
desc 'Fetches descriptions of all playgrounds and updates the readme'
task :desc do
  descs = `xcrun swift ListPlaygrounds.playground/Contents.swift`.chomp!
  
  readme = File.read('readme.md')
  allLines = readme.split("\n")
  lineIndex = allLines.index "## Playground List"
  
  raise if !lineIndex
  
  # Replace everything after this line with the playground list
  
  allLines[1 + lineIndex..-1] = descs
  
  File.open('readme.md', 'w') { |file|
    file.write allLines.join("\n")
  }
end
