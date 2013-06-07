module CrewCorner
  class EventInfo < Base
    field :arrival_date, :date
    field :arrival_time
    field :departure_date, :date
    field :departure_time
    field :checkedin, :boolean
    field :checkedin_at, :datetime
    field :checkedin_by
    field :dinner, :boolean
    field :tshirt_size
    field :gift_tshirt_size

    def self.find(uid, event_id, options = {})
      fetch("/1/eventinfo/get/#{event_id}/#{uid}", options)
    end

    def self.check_in(uid, event_id, options = {})
      fetch("/1/eventinfo/checkin/#{event_id}/#{uid}", options)
    end
  end
end
