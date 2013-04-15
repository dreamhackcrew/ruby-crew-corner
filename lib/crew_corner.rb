require 'crew_corner/client'
require 'crew_corner/base'
require 'crew_corner/event'
require 'crew_corner/user'

module CrewCorner
  def self.client
    @client ||= CrewCorner::Client.new
  end

  def self.request_filter
    @request_filter
  end

  def self.request_filter=(lambda)
    @request_filter = lambda
  end
end