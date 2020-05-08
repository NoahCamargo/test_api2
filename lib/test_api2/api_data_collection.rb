require_relative 'api_data'

module TestApi2
  class ApiDataCollection
    attr_accessor :data

    def initialize data
      self.data = data.map do |url, options|
        ApiData.new(url, options)
      end
    end

    def get_data request
      data.find { |data| data.eql? request.path, request.request_method }
    end
  end
end