namespace :test_api2 do
  desc 'TestApi provides commands to manage your API'

  task :start do
    TestApi2::Server.start
  end
end
