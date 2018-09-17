module Iteasykit
  class Fci < ApplicationRecord
    include RailsSortable::Model
    set_sortable :position

    belongs_to :fciable, polymorphic: true, optional: true
    has_many :iteasykit_fci_strings, foreign_key: :iteasykit_fci_id

    before_save :translit
    before_destroy :destroy_field

    translates :name, :help, :placeholder, :value,
        :prefix, :suffix

    default_scope { order("position ASC") }

    #validates :machine_name, uniqueness: true
    validates :name, presence: true

    def translit
      if self.machine_name.blank?
        @translit = I18n.transliterate(name)
        self.machine_name = @translit.parameterize(separator: "_")+fciable.id.to_s
      end
    end

    def value_field(ent)
      id_ent = ent.id
      m = ('Iteasykit::Fci'+type_fci.camelize).constantize
      m.find_by(fieldable_type: "Iteasykit::#{ent.class.class_name.gsub("Iteasykit", '')}", fieldable_id: id_ent, iteasykit_fci_id: id )
    end


    def type_field(ent)
      id_ent = ent.id
      m = ('Iteasykit::Fci'+type_fci.camelize).constantize

      if self.is_multi?
        m = m.where(fieldable_type: "Iteasykit::#{ent.class.class_name.gsub("Iteasykit", '')}", fieldable_id: id_ent, iteasykit_fci_id: id )
      else
        m = m.find_by(fieldable_type: "Iteasykit::#{ent.class.class_name.gsub("Iteasykit", '')}", fieldable_id: id_ent, iteasykit_fci_id: id )
      end

      case type_fci
      when "string"
        m = m.value if m
        "<input type='text' name='fcis[#{id}[fci_#{type_fci}]]' value='#{m}' id='fcis_fci_#{type_fci}' placeholder='#{placeholder}' class='form-control input-sm'>".html_safe
      when "text"
        mv = m.value if m
        ApplicationController.render(template: 'iteasykit/shared/fields/type/_cktext_area_tag', layout: false, assigns: {m: m, f: self})
      when "integer"
        m = m.value if m
        "<input type='number' name='fcis[#{id}[fci_#{type_fci}]]' value='#{m}' id='fcis_fci_#{type_fci}' placeholder='#{placeholder}' class='form-control input-sm'>".html_safe
      when "boolean"
        m = m.value if m
        "<input class='' type='checkbox' value='#{m}' name='fcis[#{id}[fci_#{type_fci}]]' id='fcis_fci_#{type_fci}'>".html_safe
      when 'image'
        if self.is_multi?
          if m
            ApplicationController.render(template: 'iteasykit/shared/fields/type/_multi_fci_images', layout: false, assigns: {m: m, f: self})
          else
            "<input multiple type='file' name='fcis[#{id}[][fci_#{type_fci}[file]]' id='fcis_fci_#{type_fci}'  accept=''>".html_safe
          end
        else
          if m
            ApplicationController.render(template: 'iteasykit/shared/fields/type/_one_fci_image', layout: false, assigns: {m: m, f: self})
          else
            "<input type='file' name='fcis[#{id}[fci_#{type_fci}[file]]' id='fcis_fci_#{type_fci}'  accept=''>".html_safe
          end
        end
      end
    end

    def destroy_field
      ('Iteasykit::Fci'+type_fci.camelize).constantize.where(iteasykit_fci_id: id).map{|f| f.destroy}
    end

  end
end
