module Iteasykit
  module FcisHelper
    def name_field(id)
      fci = Iteasykit::Fci.find(id)
      fci.name if fci
    end

    def image_url(file)
      Rails.application.routes.url_helpers.rails_blob_path(file, only_path: true)
    end
  end
end
