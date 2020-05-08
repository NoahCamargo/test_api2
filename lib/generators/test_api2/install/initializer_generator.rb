require 'rails/generators/active_record'

module TestApi2
  module Generators
    class InstallGenerator < Rails::Generators::Base
      def create_rake_task
        rakefile "test_api.rake" do
          File.open("#{File.expand_path(__dir__)}/../tasks/test_api2.rake").reduce { |a, c| a.to_s + c.to_s }
        end
      end
    end
  end
end