require 'faraday'

module CrewCorner
  class Client
    def connection
      @connection ||= Faraday.new(:url => 'http://api.crew.dreamhack.se')
    end

    def get(path, options)
      connection.get do |request|
        request.url path

        Client::filter_request!(request, options)
      end
    end

    def post(path, options, body = nil)
      connection.post do |request|
        request.url path

        Client::filter_request!(request, options)
      end
    end

    protected

    def self.filter_request!(request, options)
      CrewCorner.request_filter.call(request, options) unless CrewCorner.request_filter.nil?
    end
  end
end