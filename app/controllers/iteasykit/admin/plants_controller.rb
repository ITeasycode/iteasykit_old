require_dependency "iteasykit/application_controller"

module Iteasykit
  class Admin::PlantsController < Admin::AdminController
    before_action :set_iteasykit_plant, only: [:show, :edit, :update, :destroy]

    # GET /iteasykit_plants
    def index
      @iteasykit_plants = Iteasykit::Plant.all
    end

    # GET /iteasykit_plants/1
    def show
    end

    # GET /iteasykit_plants/new
    def new
      @iteasykit_plant = Iteasykit::Plant.new
    end

    # GET /iteasykit_plants/1/edit
    def edit
    end

    # POST /iteasykit_plants
    def create
      @iteasykit_plant = Iteasykit::Plant.new(iteasykit_plant_params)

      if @iteasykit_plant.save
        redirect_to admin_plants_url, notice: 'Iteasykit plant was successfully created.'
      else
        render :new
      end
    end

    # PATCH/PUT /iteasykit_plants/1
    def update
      if @iteasykit_plant.update(iteasykit_plant_params)
        redirect_to admin_plants_url, notice: 'Iteasykit plant was successfully updated.'
      else
        render :edit
      end
    end

    # DELETE /iteasykit_plants/1
    def destroy
      @iteasykit_plant.destroy
      redirect_to admin_plants_url, notice: 'Iteasykit plant was successfully destroyed.'
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_iteasykit_plant
        @iteasykit_plant = Iteasykit::Plant.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def iteasykit_plant_params
        params.require(:plant).permit(:site, :phone, :address_map, :geodanniye, :country, :email, :cordinates, :active)
      end
  end
end
