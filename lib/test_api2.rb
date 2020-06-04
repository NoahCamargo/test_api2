require 'webrick'
require 'yaml'
require 'json'
require 'test_api2/version'
require 'test_api2/api_data'
require 'test_api2/api_data_collection'
require 'test_api2/webrick_handler'
require 'test_api2/server'

module TestApi2
  class Error < StandardError; end
end
