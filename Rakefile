
desc 'Fetches descriptions of all playgrounds and updates the readme'
task :readme do
  descs = `xcrun swift ListPlaygrounds.playground/Contents.swift`.chomp!
  
  raise if !descs || descs.length == 0
  
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

desc 'Tests the quines'
task :test do
  
  [ 'Squine', 'CheatingQuine' ].each do |quine|
    puts "Testing #{quine}..."
    
    quinePath = "#{quine}.playground/Contents.swift"
    quineOut = `xcrun swift #{quinePath}`.chomp!  
    quineSrc = File.read(quinePath)
    
    raise if quineOut != quineSrc
    
    puts "#{quine} passed!"
  end  
end
