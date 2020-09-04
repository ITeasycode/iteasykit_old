module Iteasykit
  module EntitiesHelper
    def entities(type_id)
      Iteasykit::Entity.where(iteasykit_entity_type_id: type_id).sort()
    end
  end
end
