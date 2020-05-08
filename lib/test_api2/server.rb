module TestApi2
  class Server
    class << self
      def start port = 3000
        root = File.expand_path Rails.root.join('/test_api2/api_json.yml')
        collection = ApiDataCollection.new(YAML.load_file(root))

        server = WEBrick::HTTPServer.new :Port => port

        server.mount_proc '/' do |request, response|
          next response.status = 404 unless api_data = collection.get_data(request)

          response_data = api_data.get_response parse_body(request.body)

          response.status = response_data['status']
          response.body = response_data['body']

          (response_data['headers'] || []).each do |key, value|
            response.header[key] = value
          end
        end

        trap 'INT' do server.shutdown end

        server.start
      end

      private

      def parse_body body
        body = JSON.parse(body.to_s)
      rescue
        body = {}
      end
    end
  end
end