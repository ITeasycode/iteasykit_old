module Iteasykit
  class FciString < ApplicationRecord
    belongs_to :iteasykit_fci, class_name: "Iteasykit::Fci", optional: true
    belongs_to :fieldable, polymorphic: true, optional: true
    translates :value
<<<<<<< HEAD
    before_save :update_geo
=======
>>>>>>> da5d6b72830a0014e83c8edcc709afe275c69b23

    def self.update_or_create_by(args, attributes)
      obj = self.find_or_create_by(args)
      obj.update(attributes)
      return obj
    end

<<<<<<< HEAD
    def update_geo
      if self.iteasykit_fci_id == 267
        sadr = Iteasykit::FciString.find_by(iteasykit_fci_id: 169, fieldable_type: "Iteasykit::Cell", fieldable_id: self.fieldable_id)
        g = Geocoder.coordinates(sadr.value)
        self.value = g.to_s.gsub('[','').gsub(']','')
      elsif self.iteasykit_fci_id == 270
        sadr = Iteasykit::FciString.find_by(iteasykit_fci_id: 266, fieldable_type: "Iteasykit::Cell", fieldable_id: self.fieldable_id)
        g = Geocoder.coordinates(sadr.value)
        self.value = g.to_s.gsub('[','').gsub(']','')
      end
    end

=======
>>>>>>> da5d6b72830a0014e83c8edcc709afe275c69b23
  end
end
