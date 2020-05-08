require "bundler/gem_tasks"
require "rspec/core/rake_task"
require_relative "lib/test_api2"

path = File.expand_path(__dir__)
Dir.glob("#{path}/lib/tasks/*.rake").each(&method(:import))

RSpec::Core::RakeTask.new(:spec)

task default: 'test_api2:start'