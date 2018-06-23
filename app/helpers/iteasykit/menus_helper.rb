module Iteasykit
  module MenusHelper
    def menu_item_url(item)
      if params[:locale]
        root_url+params[:locale]+'/'+item.url if item.url
      else
        root_url+item.url if item.url
      end
    end



  end
end
