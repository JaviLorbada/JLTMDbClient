Pod::Spec.new do |s|
  s.name         = "JLTMDbClient"
  s.version      = "0.3.0"
  s.summary      = "JLTMDbClient is an iOS wrapper on top of AFNetworking to interact with www.themoviedb.org API"
  s.homepage     = "https://github.com/JaviLorbada/JLTMDbClient"
  s.screenshots  = "https://dl.dropboxusercontent.com/u/27371680/Images/Github/JLTMDbClient/MovieList.png", "https://dl.dropboxusercontent.com/u/27371680/Images/Github/JLTMDbClient/MovieDetail.png"
  s.license      = 'MIT'
  s.author       = { "JaviLorbada" => "javugi@gmail.com" }
  s.source       = { :git => "https://github.com/JaviLorbada/JLTMDbClient.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/Javi_Lorbada'
  s.platform     = :ios, '7.0'
  s.requires_arc = true
  s.source_files = 'JLTMDbClient', 'JLTMDbClient/**/*.{h,m}'
  s.dependency 'AFNetworking', '~> 3.0'
end