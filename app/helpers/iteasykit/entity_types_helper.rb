module Iteasykit
  module EntityTypesHelper

    def entity_type(model)
      Iteasykit::EntityType.where(rel_model: model)
    end
  end
end
