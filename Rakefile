require 'rubygems'
require 'bundler/setup'
require 'puppetlabs_spec_helper/rake_tasks'
require 'puppet-lint/tasks/puppet-lint'
PuppetLint.configuration.send('disable_80chars')
PuppetLint.configuration.ignore_paths = ["spec/**/*.pp", "pkg/**/*.pp" ]

task :default => :all

desc "all tasks"
task :all => [
  :metadata,
  :validate,
  :lint,
  :spec,
]
