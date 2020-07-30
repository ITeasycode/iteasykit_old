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

<<<<<<< HEAD
    def geod
      if iteasykit_entity_type_id == 20
        if self.geodannye20s.present?
          g = self.geodannye20s.first
          if self.adres20s.present?
            a = self.adres20s.first
            p a.value
            ga = Geocoder.coordinates(a.value)
            p ga
            g.update!(value: ga.to_s.gsub('[','').gsub(']',''))
          end
        else
          if self.adres20s.present?
            a = self.adres20s.first
            p a.value
            ga = Geocoder.coordinates(a.value)
            p ga
            Iteasykit::FciString.create(iteasykit_fci_id: 267, fieldable_type: "Iteasykit::Cell", fieldable_id: self.id, value: ga.to_s.gsub('[','').gsub(']',''))
          end

        end
      end
    end

    def geoddee
      if iteasykit_entity_type_id == 19
        if self.coordinates19s.present?
          g = self.coordinates19s.first
          if self.geodannye19s.present?
            a = self.geodannye19s.first
            p a.value
            ga = Geocoder.coordinates(a.value)
            p ga
            g.update!(value: ga.to_s.gsub('[','').gsub(']',''))
          end
        else
          if self.geodannye19s.present?
            a = self.geodannye19s.first
            p a.value
            ga = Geocoder.coordinates(a.value)
            p ga
            Iteasykit::FciString.create(iteasykit_fci_id: 270, fieldable_type: "Iteasykit::Cell", fieldable_id: self.id, value: ga.to_s.gsub('[','').gsub(']',''))
          end

        end
      end
    end

    def field(name, clean = false)
=======

    def field(name)
>>>>>>> da5d6b72830a0014e83c8edcc709afe275c69b23
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
<<<<<<< HEAD
		if clean
                 mfv = mf.value
else
 mfv = mf.value.html_safe
end
=======
              mfv = mf.value.html_safe
>>>>>>> da5d6b72830a0014e83c8edcc709afe275c69b23
            end
          end
        end
      end
    end

    def field_name(name)
      fci = Iteasykit::Fci.find_by_machine_name(name)
      fci.name.html_safe if fci
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
