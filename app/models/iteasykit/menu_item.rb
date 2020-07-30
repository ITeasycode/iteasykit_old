module Iteasykit
  class MenuItem < ApplicationRecord
    belongs_to :itemable, polymorphic: true, optional: true
    belongs_to :iteasykit_menu, optional: true, class_name: "Iteasykit::Menu"
    translates :name, :title, :url
    has_ancestry
    acts_as_list scope: [:ancestry]
    default_scope { order("position ASC") }
  end
end
