Github README Generator
=======================

[![Gem Version](https://img.shields.io/gem/v/github_readme_generator.svg)](https://rubygems.org/gems/github_readme_generator)
[![Gem Downloads](https://img.shields.io/gem/dt/github_readme_generator.svg)](https://rubygems.org/gems/github_readme_generator)

`github-readme-generator` lets you generate a `README.md` file simply.

# Example

```ruby
# Rakefile
require 'github_readme_generator/task'

GitHubReadmeGenerator::RakeTask.new :readme do |config|
  config.title = 'FreeRADIUS Puppet module'  # Dynamic using github lib?
  config.badges = {
    :puppetforge_version => {
      :badge   => :puppetforge,
      :type    => 'v',
      :user    => 'raphink',    # Dynamic from metadata.json?
      :project => 'freeradius', # Dynamic from metadata.json?
    },
    :puppetforge_downloads => {
      :badge   => :puppetforge,
      :type    => 'dt',
      :user    => 'raphink',    # Dynamic from metadata.json?
      :project => 'freeradius', # Dynamic from metadata.json?
    },
    :travis => {
      :badge   => :travis,
      :user    => 'raphink', # Dynamic from git
      :project => 'puppet-freeradius', # Dynamic from git?
    },
  }

It's also possible to generate documentation for a puppet-module that's not inside the root of your Rakefile. This can be done by setting a `MODULE_PATH` environment variable.

end
```
