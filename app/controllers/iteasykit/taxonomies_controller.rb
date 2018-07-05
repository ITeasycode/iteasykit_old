require_dependency "iteasykit/application_controller"

module Iteasykit
  class TaxonomiesController < ApplicationController
    before_action :set_taxonomy, only: [:show, :edit, :update, :destroy]

    # GET /taxonomies
    def index
      @taxonomies = Taxonomy.all
      @global_search = Iteasykit::FciString.where(fieldable_type: 'Iteasykit::Entity').ransack(params[:q])
      @lists = @global_search.result.page(params[:page])
    end

    # GET /taxonomies/1
    def show
      @global_search = Iteasykit::FciString.where(fieldable_type: 'Iteasykit::Entity').ransack(params[:q])
      @lists = @global_search.result.page(params[:page])
    end

    # GET /taxonomies/new
    def new
      @taxonomy = Taxonomy.new
    end

    # GET /taxonomies/1/edit
    def edit
    end

    # POST /taxonomies
    def create
      @taxonomy = Taxonomy.new(taxonomy_params)

      if @taxonomy.save

        redirect_to @taxonomy, notice: 'Taxonomy was successfully created.'
      else
        render :new
      end
    end

    # PATCH/PUT /taxonomies/1
    def update
      if @taxonomy.update(taxonomy_params)
        redirect_to @taxonomy, notice: 'Taxonomy was successfully updated.'
      else
        render :edit
      end
    end

    # DELETE /taxonomies/1
    def destroy
      @taxonomy.destroy
      redirect_to taxonomies_url, notice: 'Taxonomy was successfully destroyed.'
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_taxonomy
        @taxonomy = Taxonomy.friendly.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def taxonomy_params
        params.require(:taxonomy).permit(:ancestry, :ancestry_depth, :active, :position, :blocked, :sticky, :iteasykit_entity_type_id, :iteasykit_seomore_id)
      end
  end
end
