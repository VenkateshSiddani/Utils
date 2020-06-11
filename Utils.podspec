Pod::Spec.new do |s|
 s.name         = 'Utils'
  s.version      = '2.0.0'
  s.summary      = 'ANForce Utils Folder structure'
  s.homepage     = 'https://github.com/VenkateshSiddani/Utils'
  s.license      = 'MIT'
  s.author       = { 'VenkateshSiddani' => 'siddani.venky01@gmail.com' }
  s.source       = { :git => 'https://github.com/VenkateshSiddani/Utils.git', :branch => 'master' }
  s.platform     = :ios, '7.0'
  s.requires_arc = true
  

   s.source_files = 'Utils/Utils/*.{h,m,mm}'
   s.dependency 'BlocksKit'
   s.dependency 'FrameAccessor'
   s.dependency 'Reachability'
  


end