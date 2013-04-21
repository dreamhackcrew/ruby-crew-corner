require 'open-uri'

module CrewCorner
  class User < Base
    field :uid, :integer
    field :username
    field :firstname
    field :lastname
    field :badge_picture
    field :profile_picture

    def self.current(options = {})
      fetch("/1/user/get", options)
    end

    def self.find(uid, options = {})
      fetch("/1/user/get/#{uid}", options)
    end

    def self.search(query, options = {})
      fetch("/1/user/search/#{URI::encode(query)}", options) || []
    end

    def badge_picture_url(width = nil, height = nil)
      picture_url(badge_picture, width, height)
    end

    def profile_picture_url(width = nil, height = nil)
      picture_url(profile_picture, width, height)
    end

    private

    def picture_url(base, width, height)
      url = "http://#{base}"

      params = []
      params << "width=#{width}" unless width.nil?
      params << "height=#{height}" unless height.nil?

      url << "?#{params.join("&")}" unless params.empty?
    end
  end
end