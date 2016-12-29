# Encoding: UTF-8
$:.push File.expand_path('../lib', __FILE__)
require 'refinery/contacts/version'

version = Refinery::Contacts::Version.to_s

Gem::Specification.new do |s|
  s.platform          = Gem::Platform::RUBY
  s.name              = 'refinerycms-contacts'
  s.version           =  version
  s.description       = 'Ruby on Rails Contacts extension for Refinery CMS'
  s.summary           = 'Attach contact form to any page in Refinery CMS'
  s.email             = %q{martin.markech@matho.sk}
  s.homepage          = %q{http://github.com/Matho/refinerycms-contacts}
  s.authors           = 'Martin Markech'
  s.require_paths     = %w(lib)

  s.files             = `git ls-files`.split("\n")
  #s.test_files        = `git ls-files -- spec/*`.split("\n")

  # Runtime dependencies
  s.add_dependency             'refinerycms-core',    '~> 3.0.5'
  s.add_dependency             'recaptcha', '~> 0.3.4'

  # Development dependencies (usually used for testing)
   s.add_development_dependency 'refinerycms-testing', '~> 3.0.5'
end
