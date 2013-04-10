module CrewCorner
  class Event < Base
    field :id, :integer
    field :name
    field :start, :date
    field :end, :date
    field :active, :boolean

    def self.all
      fetch('/1/event/get/all')
    end

    def self.active
      fetch('/1/event/get')
    end

    def self.find(id)
      fetch("/1/event/get/#{id}").first
    end
  end
end