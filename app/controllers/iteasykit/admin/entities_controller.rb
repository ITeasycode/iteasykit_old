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
      @entity.build_iteasykit_seomore
    end

    # GET /entities/1/edit
    def edit
      @object_list = @entity.rel_cells.page params[:page]
      @entity.build_iteasykit_seomore if @entity.iteasykit_seomore.nil?
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
      @entity_type = @entity.iteasykit_entity_type
      @entity.destroy
      redirect_to admin_entity_type_url(@entity_type), notice: 'Entity was successfully destroyed.'
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_entity
      @entity = Entity.friendly.find(params[:id])
      @entity_type = @entity.iteasykit_entity_type
    end

    # Only allow a trusted parameter "white list" through.
    def entity_params
      params.require(:entity).permit(:machine_name, :iteasykit_entity_type_id, :active, :sticky, :iteasykit_seomore_id,
                                     :slug, :created_at, iteasykit_seomore_attributes: [:id, :noindex, :nofollow, :title, :keywords,
                                                                           :description, :canonical, :author, :publisher,
                                                                           :alternate, :refresh])
    end
  end
end
