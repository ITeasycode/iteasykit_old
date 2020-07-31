require "active_storage"
require "mini_magick"
module Iteasykit
  class Plant < ApplicationRecord
    has_one_attached :file

    translates  :site, :phone, :address_map, :geodanniye, :country, :email, :cordinates

    #before_save :update_geo

    def update_geo
      unless cordinates.present?
        g = Geocoder.coordinates(geodanniye)
        self.cordinates = g.to_s.gsub('[','').gsub(']','')
      end
    end
    
    def new_item
      
      Iteasykit::Entity.find(16).cells(19) do |cell4|

    cell = cell4 
       id= cell.id 
    foto19=cell.field(:foto19)
    strana19 = cell.field(:strana19)
          sayt19 = cell.field(:sayt19)
          email19 = cell.field(:email19) 
          geodannye19 = cell.field(:geodannye19)
    
          adres_na_karte19=cell.field(:adres_na_karte19)
    
                telefony19 = cell.field(:telefony19, true)

                cord = cell.field(:coordinates19, true)

        s = Iteasykit::Plant.new(site: sayt19, phone: telefony19, address_map: adres_na_karte19,
           geodanniye: geodannye19, country: strana19, email: email19, cordinates: cord)
          
           s.save!
s.file.attach \
  :io           => StringIO.new(foto19.download),
  :filename     => foto19.filename,
  :content_type => foto19.content_type
    end
    end
  end
end
