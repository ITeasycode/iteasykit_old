require_dependency "iteasykit/application_controller"

module Iteasykit
  class Admin::EntityTypesController < Admin::AdminController
    before_action :set_entity_type, only: [:show, :edit, :update, :destroy, :fields]

    # GET /entity_types
    def index
      @entity_types = EntityType.all
    end

    # GET /entity_types/1
    def show
      @object_list = ('Iteasykit::'+@entity_type.rel_model).constantize.where(iteasykit_entity_type_id: @entity_type.id)
    end

    def fields
      @fci = Iteasykit::Fci.new
      @fcis = Iteasykit::Fci.order(:position).where(fciable_id: @entity_type.id, fciable_type: "Iteasykit::EntityType")
    end

    # GET /entity_types/new
    def new
      @entity_type = EntityType.new
    end

    # GET /entity_types/1/edit
    def edit
    end

    # POST /entity_types
    def create
      @entity_type = EntityType.new(entity_type_params)

      if @entity_type.save
        redirect_to edit_admin_entity_type_url(@entity_type), notice: 'Entity type was successfully created.'
      else
        render :new
      end
    end

    # PATCH/PUT /entity_types/1
    def update
      if @entity_type.update(entity_type_params)
        redirect_to edit_admin_entity_type_url(@entity_type), notice: 'Entity type was successfully updated.'
      else
        render :edit
      end
    end

    # DELETE /entity_types/1
    def destroy
      @entity_type.destroy
      redirect_to admin_entity_types_url, notice: 'Entity type was successfully destroyed.'
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_entity_type
        @entity_type = EntityType.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def entity_type_params
        params.require(:entity_type).permit(:name, :machine_name, :description, :help, :active, :nesting, :relation,
                                            :path_root_url, :comment, :position, :rel_model, :id_title_fci)
      end
  end
end
