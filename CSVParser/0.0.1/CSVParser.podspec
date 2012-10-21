Pod::Spec.new do |s|
  s.name	= "CSVParser"
  s.version	= "0.0.1"
  s.summary	= "Objective-C CSV Parser."
  s.homepage	= "http://cocoawithlove.com/2009/11/writing-parser-using-nsscanner-csv.html"
  s.license	= { :type => "zlib",
		    :text => <<-LICENSE
Copyright (c) 2009-2011 Matt Gallagher. All rights reserved.

This software is provided 'as-is', without any express or implied warranty. In no event will the authors be held liable for any damages arising from the use of this software. Permission is granted to anyone to use this software for any purpose, including commercial applications, and to alter it and redistribute it freely, subject to the following restrictions:

The origin of this software must not be misrepresented; you must not claim that you wrote the original software. If you use this software in a product, an acknowledgment in the product documentation would be appreciated but is not required.
Altered source versions must be plainly marked as such, and must not be misrepresented as being the original software.
This notice may not be removed or altered from any source distribution.
LICENSE
		}
  s.author	= { "Matt Gallagher" => "matt@projectswithlove.com" }
  s.source	= { :git => "https://github.com/Smartovation/CSVParser.git", :commit => "bf3a4f4476" }

  s.ios.deployment_target = "4.0"
  s.osx.deployment_target = "10.6"

  s.source_files = "CSVParser.{h,m}"

end
