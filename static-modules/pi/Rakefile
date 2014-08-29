require 'rubygems'
require 'rake'
require 'rspec/core/rake_task'
require 'puppet-lint/tasks/puppet-lint'

link = 'spec/fixtures/modules/pi/manifests'
target = 'spec/fixtures/modules/pi/'

task :link do
  FileUtils.mkdir_p target
  symlink('../../../../manifests',link) unless File.exists?(link)
end

RSpec::Core::RakeTask.new(:spec) do |t|
  t.pattern = 'spec/*/*_spec.rb'
end

task :default => [:link,:spec]

PuppetLint.configuration.ignore_paths =['modules/**/*']
PuppetLint.configuration.send("disable_80chars")

