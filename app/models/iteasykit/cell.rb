module Iteasykit
  class Cell < ApplicationRecord
    belongs_to :iteasykit_entity_type, class_name: "Iteasykit::EntityType"
    has_many :fcis, as: :fciable
    has_many :iteasykit_rel_cells, class_name: "Iteasykit::RelCell", foreign_key: :iteasykit_cell_id, dependent: :destroy
    #before_destroy :destroy_field

    Iteasykit::EntityType.where(rel_model: 'Cell').includes(:fcis).each do |et|
      et.fcis.each do |fci|
        has_many fci.machine_name.pluralize.to_sym, -> {where(fieldable_type: 'Iteasykit::Cell', iteasykit_fci_id: fci.id)}, class_name: "Iteasykit::Fci#{fci.type_fci.camelize}", foreign_key: :fieldable_id
      end
    end

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

    def field_name(name)
      fci = Iteasykit::Fci.find_by_machine_name(name)
      fci.name if fci
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
