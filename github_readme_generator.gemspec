# coding: utf-8

Gem::Specification.new do |spec|
  spec.name               = "github_readme_generator"
  spec.version            = '0.1.2'

  spec.required_ruby_version     = ">= 1.9.3"
  spec.authors = ["Raphaël Pinson"]
  spec.email = "raphael.pinson@camptocamp.com"
  spec.date = `date +"%Y-%m-%d"`.strip!
  spec.summary = "Generate README.md automatically"
  spec.description = "Generate README.md automatically"
  spec.homepage = "https://github.com/raphink/github-readme-generator"
  spec.license       = "Apache 2.0"

  spec.files = `git ls-files -z`.split("\x0")
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]
end
