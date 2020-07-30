module Iteasykit
  class FciText < ApplicationRecord
    belongs_to :iteasykit_fci, class_name: "Iteasykit::Fci", optional: true
    belongs_to :fieldable, polymorphic: true, optional: true
    translates :value

    def self.update_or_create_by(args, attributes)
      obj = self.find_or_create_by(args)
      obj.update(attributes)
      return obj
    end

  end
end
