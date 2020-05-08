require 'rails/generators/active_record'

class InitializerGenerator < Rails::Generators::Base
  def create_rake_task
    rakefile "test_api.rake" do
      File.open('../tasks/test_api2.rake').reduce { |a, c| a.to_s + c.to_s }
    end
  end
end