require_dependency "iteasykit/application_controller"

module Iteasykit
  class  Admin::CellsController < Admin::AdminController
    before_action :set_cell, only: [:show, :edit, :update, :destroy]

    # GET /cells
    def index
      @cells = Cell.all
    end

    # GET /cells/1
    def show
    end

    # GET /cells/new
    def new
      @entity_type = Iteasykit::EntityType.find(params[:entity_type])
      @cell = Cell.new
      @group_list = Iteasykit::Cell.all.map{|e| e.group}.uniq
    end

    # GET /cells/1/edit
    def edit
    end

    # POST /cells
    def create
      @cell = Cell.new(cell_params)

      if @cell.save
        fci_saver(@cell, params[:fcis])
        redirect_to edit_admin_cell_url(@cell), notice: 'Cell was successfully created.'
      else
        render :new
      end
    end

    # PATCH/PUT /cells/1
    def update
      if @cell.update(cell_params)
        fci_saver(@cell, params[:fcis])
        redirect_to edit_admin_cell_url(@cell), notice: 'Cell was successfully updated.'
      else
        render :edit
      end
    end

    # DELETE /cells/1
    def destroy
      @cell.destroy
      redirect_to admin_cells_url, notice: 'Cell was successfully destroyed.'
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_cell
        @cell = Cell.find(params[:id])
        @entity_type = @cell.iteasykit_entity_type
        @group_list = Iteasykit::Cell.all.map{|e| e.group}.uniq
      end

      # Only allow a trusted parameter "white list" through.
      def cell_params
        params.require(:cell).permit(:iteasykit_entity_type_id, :active, :sticky, :position, :group, :machine_name)
      end
  end
end
