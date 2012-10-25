Pod::Spec.new do |s|
  s.name     = 'XMLReader'
  s.version  = '0.0.1.jc'
  s.license  = 'MIT'
  s.summary  = 'An NSXMLParser-based XML to NSDictionary converter.'
  s.homepage = 'https://github.com/RestKit/XML-to-NSDictionary'
  s.authors = { 'Caccinolo Benoit'   => 'benoit.caccinolo@gmail.com',
                'ezgit'              => 'anonb5+git@gmail.com',
                'Insert-Witty-Name'  => 'tias_dp@hotmail.com',
                'Christopher Swasey' => 'chris@gateguruapp.com' }

  #s.source   = { :git => 'https://github.com/RestKit/XML-to-NSDictionary.git', :tag => '0.0.1' }
  s.source   = { :git => 'https://github.com/RestKit/XML-to-NSDictionary.git', :commit => '30ca7efa24197df3cb27ffbf2e4afafd8fa827f2' }

  def s.post_install(target)
    old_header = File.read( config.project_pods_root + 'XMLReader/XMLReader.h' )

    File.open("#{config.project_pods_root}/XMLReader/XMLReader.h", "w+") do |file|
      file.puts old_header.sub("    NSError", "    __autoreleasing NSError")
    end
  end

  s.source_files = '*.{h,m}'
end
