module TestApi2
  module WEBrick
    module HTTPServlet
      class ProcHandler
        alias do_PUT    do_GET
        alias do_DELETE do_GET

        def do_OPTIONS  request, response
          response.status = 204
          response['X-Content-Type-Options'] = 'nosniff'
        end
      end
    end
  end
end