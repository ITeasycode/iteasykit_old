require_dependency "iteasykit/application_controller"

module Iteasykit
  class Admin::EntitiesController < Admin::AdminController
    before_action :set_entity, only: [:show, :edit, :update, :destroy, :custom_fields]

    # GET /entities
    def index
      @entities = Entity.all
    end

    # GET /entities/1
    def show

    end

    def custom_fields
      @fci = Iteasykit::Fci.new
      @fcis = Iteasykit::Fci.order(:position).where(fciable_id: @entity.id, fciable_type: "Iteasykit::Entity")
    end

    # GET /entities/new
    def new
      @entity_type = Iteasykit::EntityType.find(params[:entity_type])
      @entity = Entity.new
    end

    # GET /entities/1/edit
    def edit

    end

    # POST /entities
    def create
      @entity = Entity.new(entity_params)

      if @entity.save
        fci_saver(@entity, params)

        redirect_to edit_admin_entity_url(@entity), notice: 'Entity was successfully created.'
      else
        render :new
      end
    end

    # PATCH/PUT /entities/1
    def update
      if @entity.update(entity_params)
        fci_saver(@entity, params)

        redirect_to edit_admin_entity_url(@entity), notice: 'Entity was successfully updated.'
      else
        render :edit
      end
    end

    # DELETE /entities/1
    def destroy
      @entity.destroy
      redirect_to admin_entities_url, notice: 'Entity was successfully destroyed.'
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_entity
      @entity = Entity.friendly.find(params[:id])
      @entity_type = @entity.iteasykit_entity_type
    end

    # Only allow a trusted parameter "white list" through.
    def entity_params
      params.require(:entity).permit(:machine_name, :iteasykit_entity_type_id, :active, :sticky, :iteasykit_seomore_id)
    end
  end
end
