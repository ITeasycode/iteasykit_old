module Iteasykit
  module CellsHelper

    def relscells(obj,mid)
      obj.rel_cells.joins(:iteasykit_cell).where(iteasykit_cells: {iteasykit_entity_type_id: mid}).page(params[:page]).per(6)
    end

  end
end
