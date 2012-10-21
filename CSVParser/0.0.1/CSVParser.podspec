Pod::Spec.new do |s|
  s.name	= "CSVParser"
  s.version	= "0.0.1"
  s.summary	= "Objective-C CSV Parser."
  s.homepage	= "http://cocoawithlove.com/2009/11/writing-parser-using-nsscanner-csv.html"
  s.license	= { :type => "MIT",
		    :text => <<-LICENSE
Created by Matt Gallagher on 2009/11/30.
Copyright 2009 Matt Gallagher. All rights reserved.

Permission is given to use this source code file, free of charge, in any
project, commercial or otherwise, entirely at your risk, with the condition
that any redistribution (in part or whole) of source code must retain
this copyright and permission notice. Attribution in compiled projects is
appreciated but not required.
LICENSE
		}
  s.author	= { "Matt Gallagher" => "matt@projectswithlove.com" }
  s.source	= { :git => "https://github.com/Smartovation/CSVParser.git", :commit => "bf3a4f4476" }

  s.ios.deployment_target = "4.0"
  s.osx.deployment_target = "10.6"

  s.source_files = "CSVParser.{h,m}"

end
