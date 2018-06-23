module Iteasykit
  class Form < ApplicationRecord
    translates :slug
    extend FriendlyId
    friendly_id :machine_name, :use => [:slugged, :finders, :globalize, :history]
    belongs_to :iteasykit_entity_type, class_name: "Iteasykit::EntityType"
    belongs_to :iteasykit_seomore, optional: true
    has_many :fcis, as: :fciable


    def field(name)
      fci = Iteasykit::Fci.find_by_machine_name(name)
      if fci
        m = ('Iteasykit::Fci'+fci.type_fci.camelize).constantize
        mf = m.find_by(iteasykit_fci_id: fci.id, fieldable_type: 'Iteasykit::Form', fieldable_id: id)
        if mf
          if mf.value.class == String
            mfv = mf.value.html_safe
          else
            mfv = mf.value
          end
        end
      end
    end

  end
end
