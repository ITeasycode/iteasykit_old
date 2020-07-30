module Iteasykit
  module FcisHelper
    def name_field(id)
      fci = Iteasykit::Fci.find(id)
      fci.name if fci
    end
  end
end
