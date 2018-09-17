require "active_storage"
require "mini_magick"
module Iteasykit
  class FciImage < ApplicationRecord
    belongs_to :iteasykit_fci, class_name: "Iteasykit::Fci", optional: true
    has_one_attached :file
    translates :title, :alt

    def self.update_or_create_by(args, attributes = nil)
      attributes = args
      obj = self.find_or_create_by(args)
      obj.update(attributes) unless attributes.nil?
      return obj
    end

  end
end
