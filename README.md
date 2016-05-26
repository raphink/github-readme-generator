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
    :jenkins => {
      :badge        => :jenkins,
      :jenkins_url  => 'https://myjenkinsinstance.com/job/puppet-freeradius'
    },
  }
end
```

## Dependencies

It's required to install the 'Embeddable Build Status'-plugin in Jenkins if you want to embed Jenkins' build badges.
