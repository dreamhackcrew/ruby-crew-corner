module CrewCorner
  class Client
    def connection
      @connection ||= Faraday.new(:url => 'http://api.crew.dreamhack.se')
    end

    def get(path, params = nil)
      connection.get(path)
    end

    def post(path, params = nil, body = nil)
      connection.post(path)
    end
  end
end