require 'bundler/gem_tasks'
require 'rspec/core/rake_task'
require 'rubocop/rake_task'

# RSpec::Core::RakeTask.new(:spec)

task default: :spec

tests = %w(default ec2 s3).each do |type|
  'spec:' + type
end

task spec: 'spec:all'
namespace :spec do
  task all: ['spec:tests', 'spec:rubocop']
  task tests: tests

  tests.each do |test|
    desc 'Run tests to ' + test
    RSpec::Core::RakeTask.new(test) do |t|
      t.pattern = 'spec/' + test + '_spec.rb'
    end
  end

  RuboCop::RakeTask.new
end
