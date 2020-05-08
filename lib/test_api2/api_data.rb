module TestApi2
  class ApiData
    attr_accessor :status, :uri, :success, :error, :params, :headers, :method

    def initialize uri, data
      self.uri = Regexp.new("#{uri.gsub(/[A-Z]+/, '[^\/]+')}(/|)\\Z")
      self.status = data['status']
      self.method = (data['method'] || 'GET').upcase
      self.success = data['success']
      self.error = data['error']
      self.params = data['params']
      self.headers = data['headers']
    end

    def eql? path, method
      uri === path && self.method == method
    end

    def params?
      !!params
    end

    def has_error? body
      params? && (body.keys & params).length.zero?
    end

    def get_response body
      has_error = has_error?(body)
      response_data = has_error ? error : success

      if !response_data.key?('status')
        response_data['status'] = has_error ? 400 : 200
      end

      response_data
    end
  end
end