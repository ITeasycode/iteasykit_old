require_dependency "iteasykit/application_controller"

module Iteasykit
  class Admin::TaxonomiesController < Admin::AdminController
    before_action :set_taxonomy, only: [:show, :edit, :update, :destroy, :custom_fields]

    # GET /taxonomies
    def index
      @taxonomies = Taxonomy.all
    end

    # GET /taxonomies/1
    def show
      if params[:reltaxentity].present?
        Iteasykit::RelTaxonomy.create(iteasykit_taxonomy_id: @taxonomy.id, relable_type: params[:reltaxtype],
                                      relable_id: params[:reltaxentity].to_s)
        redirect_back(fallback_location: admin_entity_types_url)
      end
      if params[:delreltaxentity].present?
        rel = Iteasykit::RelTaxonomy.find_by(iteasykit_taxonomy_id: @taxonomy.id, relable_type: params[:reltaxtype],
                                      relable_id: params[:delreltaxentity].to_s)
        rel.destroy if rel
        redirect_back(fallback_location: admin_entity_types_url)
      end
    end

    def custom_fields
      @fci = Iteasykit::Fci.new
      @fcis = Iteasykit::Fci.order(:position).where(fciable_id: @taxonomy.id, fciable_type: "Iteasykit::Taxonomy")
    end

    # GET /taxonomies/new
    def new
      @entity_type = Iteasykit::EntityType.find(params[:entity_type])
      @taxonomy = Taxonomy.new
    end

    # GET /taxonomies/1/edit
    def edit
    end

    # POST /taxonomies
    def create
      @taxonomy = Taxonomy.new(taxonomy_params)

      if @taxonomy.save
        fci_saver(@taxonomy, params)
        redirect_to edit_admin_taxonomy_url(@taxonomy), notice: 'Taxonomy was successfully created.'
      else
        render :new
      end
    end

    # PATCH/PUT /taxonomies/1
    def update
      if @taxonomy.update(taxonomy_params)
        fci_saver(@taxonomy, params)
        redirect_to edit_admin_taxonomy_url(@taxonomy), notice: 'Taxonomy was successfully updated.'
      else
        render :edit
      end
    end

    # DELETE /taxonomies/1
    def destroy
      @entity_type = @taxonomy.iteasykit_entity_type
      @taxonomy.destroy
      redirect_back(fallback_location: admin_entity_type_url(@entity_type))
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_taxonomy
        @taxonomy = Taxonomy.friendly.find(params[:id])
        @entity_type = @taxonomy.iteasykit_entity_type
      end

      # Only allow a trusted parameter "white list" through.
      def taxonomy_params
        params.require(:taxonomy).permit(:ancestry, :ancestry_depth, :active, :position, :blocked, :sticky,
                                         :iteasykit_entity_type_id, :iteasykit_seomore_id, :slug, :machine_name)
      end
  end
end
