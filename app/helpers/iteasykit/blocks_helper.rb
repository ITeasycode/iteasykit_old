module Iteasykit
  module BlocksHelper
    def blocks(region)
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
  end
end
