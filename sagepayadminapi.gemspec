# -*- encoding: utf-8 -*-
require File.expand_path('../lib/sagepayadminapi', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Colin Burn-Murdoch"]
  gem.email         = ["colin@burn-murdoch.com"]
  gem.description   = "Ruby interface to the SagePay Admin & Reporting API"
  gem.summary       = "SagePay Admin & Reporting API"
  gem.homepage      = "http://github.com/colinbm/sagepayadminapi-ruby"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "sagepayadminapi"
  gem.require_paths = ["lib"]
  gem.version       = SagePayAdminAPI::VERSION
  gem.add_dependency 'xml-simple'
end
