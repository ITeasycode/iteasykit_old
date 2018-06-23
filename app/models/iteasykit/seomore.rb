module Iteasykit
  class Seomore < ApplicationRecord
    translates :title, :description, :canonical,
               :author, :publisher, :alternate, :refresh, :keywords
    default_scope { order("created_at DESC") }
  end
end
