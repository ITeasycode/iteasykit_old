require "active_storage"
require "mini_magick"
module Iteasykit
  class Partner < ApplicationRecord
    translates :name, :site, :phone, :address, :city_ukr, :city_mold, :coordinates

    #before_save :update_geo

    def update_geo
      g = Geocoder.coordinates(address)
      self.coordinates = g.to_s.gsub('[','').gsub(']','')
    end

    def new_item
      
      Iteasykit::Entity.find(25).cells(20) do |cell4|

    cell = cell4 
    nazv = cell.field(:nazvanie20)
    sayt = cell.field(:sayt20)
    phone = cell.field(:telefony20)
    addr = cell.field(:adres20)
    coord = cell.field(:coordinates20)
    city_u = cell.field(:gorod20)
    city_m = cell.field(:gorodm)

        s = Iteasykit::Partner.new(name: nazv, site: sayt, phone: phone, address: addr,
                                 coordinates: coord, city_ukr: city_u, city_mold: city_m)
          
           s.save!
        end
      end

  end
end
