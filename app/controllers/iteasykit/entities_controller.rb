require_dependency "iteasykit/application_controller"

module Iteasykit
  class EntitiesController < ApplicationController
    before_action :set_entity, only: [:show, :edit, :update, :destroy]

    # GET /entities
    def index
      @entities = Entity.all
      @global_search = Iteasykit::FciString.where(fieldable_type: 'Iteasykit::Entity').ransack(params[:q])
      @global_search2 = Iteasykit::FciText.where(fieldable_type: 'Iteasykit::Entity').ransack(params[:q])
      if params[:q].present?
        @qq = @global_search.result + @global_search2.result
      else
        @qq = @global_search.result
      end
      @lists = @qq.uniq
    end

    # GET /entities/1
    def show
      @global_search = Iteasykit::FciString.where(fieldable_type: 'Iteasykit::Entity').ransack(params[:q])
      @global_search2 = Iteasykit::FciText.where(fieldable_type: 'Iteasykit::Entity').ransack(params[:q])
      if params[:q].present?
        @qq = @global_search.result + @global_search2.result
      else
        @qq = @global_search.result
      end
      @lists = @qq.uniq { |p| p.fieldable_id }
    end

    # GET /entities/new
    def new
      @entity = Entity.new
    end

    # GET /entities/1/edit
    def edit
    end

    # POST /entities
    def create
      @entity = Entity.new(entity_params)

      if @entity.save
        redirect_to @entity, notice: 'Entity was successfully created.'
      else
        render :new
      end
    end

    # PATCH/PUT /entities/1
    def update
      if @entity.update(entity_params)
        redirect_to @entity, notice: 'Entity was successfully updated.'
      else
        render :edit
      end
    end

    # DELETE /entities/1
    def destroy
      @entity.destroy
      redirect_to entities_url, notice: 'Entity was successfully destroyed.'
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_entity
        @entity = Entity.friendly.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def entity_params
        params.require(:entity).permit(:machine_name, :iteasykit_entity_type_id, :active, :sticky, :iteasykit_seomore_id)
      end
  end
end
