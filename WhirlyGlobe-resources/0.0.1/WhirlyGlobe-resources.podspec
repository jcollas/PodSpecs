Pod::Spec.new do |s|
  s.name         = "WhirlyGlobe-resources"
  s.version      = "0.0.1"
  s.summary      = "WhirlyGlobe shared resources."
  s.homepage     = "https://github.com/mousebird/WhirlyGlobe"
  s.license      = { :type => "Apache 2.0" }
  s.author       = { "Steve Gifford" => "sjg@mousebirdconsulting.com" }
  s.source       = { :git => "https://github.com/mousebird/wg-resources.git", :commit => "e6add0e836" }

  s.platform	 = :ios
  
  s.subspec 'base-maps-big' do |maps|
    maps.resources = 'base_maps/big_wtb/*'
  end

  s.subspec 'base-maps-lowres' do |maps|
    maps.resources = 'base_maps/lowres_wtb/*'
  end

  s.subspec 'base-maps-geography' do |maps|
    maps.resources = 'base_maps/geography-class.mbtiles'
  end

  s.subspec 'country_json_50m' do |maps|
    maps.resources = 'vectors/country_json_50m/*.geojson'
  end

  s.subspec 'shapefiles' do |maps|
    maps.resources = 'vectors/shapefiles/**'
  end

end
