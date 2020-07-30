require_dependency "iteasykit/application_controller"

module Iteasykit
  class Admin::BlocksController < Admin::AdminController
    before_action :set_block, only: [:show, :edit, :update, :destroy, :custom_fields]

    # GET /blocks
    def index
      @block_entity_types = Iteasykit::EntityType.where(rel_model: 'Block')
      @blocks = Block.all
    end

    # GET /blocks/1
    def show
    end

    def custom_fields
      @fci = Iteasykit::Fci.new
      @fcis = Iteasykit::Fci.order(:position).where(fciable_id: @block.id, fciable_type: "Iteasykit::Block")
    end

    # GET /blocks/new
    def new
      @entity_type = Iteasykit::EntityType.find(params[:entity_type]) if params[:entity_type]
      @block = Block.new
    end

    # GET /blocks/1/edit
    def edit
      @object_list = @block.rel_cells.page params[:page]
    end

    # POST /blocks
    def create
      @block = Block.new(block_params)

      if @block.save
        fci_saver(@block, params)
        redirect_to edit_admin_block_url(@block), notice: 'Block was successfully created.'
      else
        render :new
      end
    end

    # PATCH/PUT /blocks/1
    def update
      if @block.update(block_params)
        fci_saver(@block, params)
        redirect_to edit_admin_block_url(@block), notice: 'Block was successfully updated.'
      else
        render :edit
      end
    end

    # DELETE /blocks/1
    def destroy
      @block.destroy
      redirect_to blocks_url, notice: 'Block was successfully destroyed.'
    end

    def sort
      params[:blocks].each do |key, value|
        Block.find(value[:id]).update_attributes(position: value[:position], region: value[:region])
      end
      render :nothing => true
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_block
        @block = Block.find(params[:id])
        @entity_type = @block.iteasykit_entity_type
      end

      # Only allow a trusted parameter "white list" through.
      def block_params
        params.require(:block).permit(:admin_name, :region, :type_url, :url, :etl_type, :entity_type_lists, :description_admin,
                                      :machine_name, :active, :position, :system, :iteasykit_entity_type_id, :elementcls, :idcls, :csscls)
      end
  end
end
