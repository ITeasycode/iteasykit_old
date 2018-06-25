module Iteasykit
  class RelCell < ApplicationRecord
    belongs_to :iteasykit_cell, class_name: "Iteasykit::Cell", optional: true
    belongs_to :relable, polymorphic: true, optional: true
  end
end
