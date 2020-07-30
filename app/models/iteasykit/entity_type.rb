module Iteasykit
  class EntityType < ApplicationRecord
    has_many :iteasykit_entities, class_name: "Iteasykit::Entity", foreign_key: :iteasykit_entity_type_id
    has_many :iteasykit_cells, class_name: "Iteasykit::Cell", foreign_key: :iteasykit_entity_type_id
    has_many :fcis, as: :fciable
    translates :name, :description, :help
    before_save :translit

    def translit
      if self.machine_name.blank?
        @translit = name
        self.machine_name = @translit.parameterize(separator: "_")
      end
    end
  end
end
