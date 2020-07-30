module Iteasykit
  module CellsHelper

    def relscells(obj,mid)
      obj.iteasykit_cells.where(iteasykit_entity_type_id: mid).page(params[:page]).per(6)
    end

  end
end
