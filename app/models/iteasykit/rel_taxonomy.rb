module Iteasykit
  class RelTaxonomy < ApplicationRecord
    belongs_to :iteasykit_taxonomy, class_name: "Iteasykit::Taxonomy", optional: true
    belongs_to :relable, polymorphic: true, optional: true
  end
end
