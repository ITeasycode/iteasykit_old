module Iteasykit
  class Taxonomy < ApplicationRecord
    translates :slug
    extend FriendlyId
    friendly_id :slug, :use => [:slugged, :finders, :globalize, :history]
    belongs_to :iteasykit_entity_type, class_name: "Iteasykit::EntityType"
    belongs_to :iteasykit_seomore, optional: true
    has_many :fcis, as: :fciable
    has_many :iteasykit_rel_taxonomies, class_name: "Iteasykit::RelTaxonomy", foreign_key: :iteasykit_taxonomy_id
<<<<<<< HEAD
    has_many :relables, through: :iteasykit_rel_taxonomies
=======
>>>>>>> da5d6b72830a0014e83c8edcc709afe275c69b23
    has_ancestry

    after_save :translit

    def translit
      if slug.blank?
        if self.title.present?
          @translit = I18n.transliterate(self.title)
          update(slug: @translit.parameterize(separator: "_")+id.to_s)
        else
          update(slug: self.id)
        end
      end
    end

    def field(name)
      fci = Iteasykit::Fci.find_by_machine_name(name)
      if fci
        m = ('Iteasykit::Fci'+fci.type_fci.camelize).constantize
        mf = m.find_by(iteasykit_fci_id: fci.id, fieldable_type: 'Iteasykit::Taxonomy', fieldable_id: id)
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
        mf = FciString.find_by(iteasykit_fci_id: fci.id, fieldable_type: 'Iteasykit::Taxonomy', fieldable_id: id)
        if mf
          mf.value.html_safe
        end
      end
    end

  end
end
