module Iteasykit
  class Block < ApplicationRecord
    belongs_to :iteasykit_entity_type, class_name: "Iteasykit::EntityType", optional: true
    translates :admin_name, :description_admin
    has_many :fcis, as: :fciable, class_name: "Iteasykit::Fci", foreign_key: :fciable_id
    has_many :rel_cells, as: :relable, class_name: "Iteasykit::RelCell", foreign_key: :relable_id


    def field(name)
      fci = Iteasykit::Fci.find_by_machine_name(name)
      if fci
        m = ('Iteasykit::Fci'+fci.type_fci.camelize).constantize
        mf = m.find_by(iteasykit_fci_id: fci.id, fieldable_type: 'Iteasykit::Block', fieldable_id: id)
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
        mf = FciString.find_by(iteasykit_fci_id: fci.id, fieldable_type: 'Iteasykit::Block', fieldable_id: id)
        if mf
          mf.value.html_safe
        end
      end
    end

  end
end
