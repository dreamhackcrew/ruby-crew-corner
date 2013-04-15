require 'json'

module CrewCorner
  class Base
    def [](attribute)
      attrs[attribute]
    end

    def []=(attribute, value)
      attrs[attribute] = value
    end

    protected

    def self.field(name, type = :string)
      define_method(name) { self[name] }
      define_method("#{name}=") { |value| self[name] = value }

      field_types[name] = type
    end

    def self.fetch(path, options = {})
      response = CrewCorner.client.get(path, options)

      parse(response.body) unless response.body.nil?
    end

    def self.parse(body)
      attributes_or_array = JSON.parse(body)

      case attributes_or_array
      when Array
        attributes_or_array.map do |attributes|
          self.new_with_attributes(attributes)
        end
      when Hash
        self.new_with_attributes(attributes_or_array)
      end
    end

    def self.new_with_attributes(attributes)
      new = self.new

      attributes.each do |attribute, value|
        attribute = attribute.to_sym

        converted_value = begin
          case self.field_types[attribute]
          when :date
            value.to_date unless value == '0000-00-00'
          when :integer
            value.to_i
          when :boolean
            value == 'Y'
          else
            value
          end
        rescue
          nil
        end

        new[attribute] = converted_value
      end

      new
    end

    private

    def self.field_types
      @field_types ||= { }
    end

    def attrs
      @attrs ||= { }
    end
  end
end