require 'test_api2/version'
require 'test_api2/api_data'
require 'test_api2/api_data_collection'
require 'test_api2/server'
require 'webrick'
require 'yaml'
require 'json'

module TestApi2
  class Error < StandardError; end
end
