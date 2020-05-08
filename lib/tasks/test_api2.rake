namespace :test_api2 do
  desc 'TestApi provides commands to manage your API'

  task :start, %i[port] => %i[port] do |t, args|
    TestApi2::Server.start args[:port] || 3000
  end
end
