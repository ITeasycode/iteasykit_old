module Iteasykit
  module MenusHelper

    def menu_item_url(item)
      if params[:locale]
        '/'+params[:locale]+'/'+item.url if item.url
      else
        '/'+item.url if item.url
      end
    end

    def roots_menu_items(machine_name)
      Menu.find_by_machine_name(machine_name).menu_items.includes(:translations).where(active: true).roots
    end

    
  end
end
