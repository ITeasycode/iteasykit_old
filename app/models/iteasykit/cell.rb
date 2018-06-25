module Iteasykit
  class Cell < ApplicationRecord
    belongs_to :iteasykit_entity_type, class_name: "Iteasykit::EntityType"
    has_many :fcis, as: :fciable
    has_many :iteasykit_rel_cells, class_name: "Iteasykit::RelCell", foreign_key: :iteasykit_cell_id
    #before_destroy :destroy_field

    default_scope { order("position ASC") }


    def field(name)
      fci = Iteasykit::Fci.find_by_machine_name(name)
      if fci
        m = ('Iteasykit::Fci'+fci.type_fci.camelize).constantize
        mf = m.find_by(iteasykit_fci_id: fci.id, fieldable_type: 'Iteasykit::Cell', fieldable_id: id)
        if mf
          if m.class_name == "IteasykitFciImage"
            mf.file
          else
            if mf.value.class == Integer
              mfv = mf.value
            else
              mfv = mf.value.html_safe
            end
          end
        end
      end
    end

    def title
      if iteasykit_entity_type.id_title_fci.present?
        fci = Iteasykit::Fci.find(iteasykit_entity_type.id_title_fci)
        mf = FciString.find_by(iteasykit_fci_id: fci.id, fieldable_type: 'Iteasykit::Cell', fieldable_id: id)
        if mf
          mf.value.html_safe
        end
      end
    end

  end
end
