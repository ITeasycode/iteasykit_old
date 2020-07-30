module Iteasykit
  class Menu < ApplicationRecord
    has_many :menu_items, -> { order(position: :asc) }, class_name: "Iteasykit::MenuItem", foreign_key: 'iteasykit_menu_id'
    translates :name, :description
    before_save :translit
    after_create :new_menu_block
    default_scope { order("created_at DESC") }

    def translit
      if self.machine_name.blank?
        @translit = name
        self.machine_name = @translit.parameterize(separator: "_")
      end
    end

    def new_menu_block
      block=Block.create(active: true, csscls: self.machine_name, machine_name: self.machine_name, system: true,
                        region: '')
    end
  end
end
