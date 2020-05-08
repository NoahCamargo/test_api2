require 'rails/generators/active_record'

module TestApi2
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path("../templates", __FILE__)

      def create_rake_task
        rakefile "test_api.rake" do
          File.open(
            "#{File.expand_path(__dir__)}/../../../tasks/test_api2.rake"
          ).reduce { |a, c| a.to_s + c.to_s }
        end
      end

      def copy_example_file
        template 'example.yml', 'test_api2/api_json.yml'
      end
    end
  end
end