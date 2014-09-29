$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "yt_streams/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "yt_streams"
  s.version     = YtStreams::VERSION
  s.authors     = ["Rien Croonenborghs"]
  s.email       = ["rien@croonenborghs.net"]
  s.homepage    = "http://github.com/riencroonenborghs/yt_streams"
  s.summary     = "Get a download link of your favourite YouTube video."
  s.description = "Get a download link of your favourite YouTube video."
  s.license     = "MIT"

  s.add_dependency("httparty")

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["spec/**/*"]
end
