namespace :test_api2 do
  desc 'TestApi provides commands to manage your API'

  task :start, port: 3000 do |t, args|
    TestApi2::Server.start args[:port]
  end
end
