module Iteasykit
  class Taxonomy < ApplicationRecord
    belongs_to :iteasykit_entity_type
    belongs_to :iteasykit_seomore
    has_ancestry
  end
end
