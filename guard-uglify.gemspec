# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require 'guard/uglify/version'

Gem::Specification.new do |s|
  s.name        = "guard-uglify"
  s.version     = Guard::UglifyVersion::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Aaron Cruz"]
  s.email       = ["aaron@aaroncruz.com"]
  s.homepage    = "http://aaroncruz.com"
  s.summary     = %q{guard file for the uglifier gem}
  s.description = %q{guard file for the uglifier gem}

  s.rubyforge_project = "guard-uglify"
  
  s.add_dependency 'guard', '>= 0.2.2'
  s.add_dependency "uglifier"
  
  s.files        = Dir.glob('{lib}/**/*') #+ %w[LICENSE README.rdoc]
  s.require_path = 'lib'
end
