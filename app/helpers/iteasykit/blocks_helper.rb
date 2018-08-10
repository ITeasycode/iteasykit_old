module Iteasykit
  module BlocksHelper
    def region(region)
      @blocks = Block.where(region: region)
      render 'iteasykit/shared/blocks/list', locale: @blocks
    end

    def blocks_type(type)
      rt=Iteasykit::EntityType.includes(:translations).find_by_machine_name(type)
      Iteasykit::Block.where(iteasykit_entity_type_id: rt.id) unless rt.nil?
    end

    def block(name)
      @block = Iteasykit::Block.includes(:translations).find_by(machine_name: name)
      render 'iteasykit/shared/blocks/show', locale: @block
    end

    def geocod(d)
      Rails.cache.fetch('helper_value') do
      @arrr =[]
      Iteasykit::FciString.where(iteasykit_fci_id: d).each do |string|
          @results = Geocoder.coordinates(string.value)
          unless @results.nil?
              @results << string.fieldable_id
              @arrr << @results
          end
      end
      @arrr
    end
  end

  end
end
