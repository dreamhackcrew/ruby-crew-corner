require 'crew_corner/client'
require 'crew_corner/base'
require 'crew_corner/event'

module CrewCorner
  def self.client
    @client ||= CrewCorner::Client.new
  end
end