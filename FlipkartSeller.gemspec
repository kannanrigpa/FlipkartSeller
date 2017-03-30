# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'FlipkartSeller/version'

Gem::Specification.new do |spec|
  spec.name          = "FlipkartSeller"
  spec.version       = FlipkartSeller::VERSION
  spec.authors       = ["Atish Kumar Sahoo"]
  spec.email         = ["atish90@gmail.com"]

  spec.summary       = "A flipkart seller can do all the seller activities like update product info, search orders, print shipping labels and invoices, and manage orders at different stages of the order lifecycle etc using this gem."
  spec.description   = "The Flipkart Marketplace Seller Platform allows sellers to register their businesses, sell products, and manage various aspects related to the products and orders. This section familiarizes you with the key business processes and system concepts in the Marketplace."
  spec.homepage      = "https://AtishSahoo@gitlab.com/AtishSahoo/FlipkartSeller"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    # spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.12"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "rest-client"
end
