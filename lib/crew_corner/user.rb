module CrewCorner
  class User < Base
    field :uid, :integer
    field :username

    def self.current(options = {})
      fetch("/1/user/get", options)
    end

    def self.find(uid, options = {})
      fetch("/1/user/get/#{uid}", options)
    end
  end
end