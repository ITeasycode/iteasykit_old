require_dependency "iteasykit/application_controller"

module Iteasykit
  class Admin::PartnersController < Admin::AdminController
    before_action :set_partner, only: [:show, :edit, :update, :destroy]

    # GET /partners
    def index
      @partners = Partner.all
    end

    # GET /partners/1
    def show
    end

    # GET /partners/new
    def new
      @partner = Partner.new
    end

    # GET /partners/1/edit
    def edit
    end

    # POST /partners
    def create
      @partner = Partner.new(partner_params)

      if @partner.save
        redirect_to admin_partners_url, notice: 'Partner was successfully created.'
      else
        render :new
      end
    end

    # PATCH/PUT /partners/1
    def update
      if @partner.update(partner_params)
        redirect_to admin_partners_url, notice: 'Partner was successfully updated.'
      else
        render :edit
      end
    end

    # DELETE /partners/1
    def destroy
      @partner.destroy
      redirect_to admin_partners_url, notice: 'Partner was successfully destroyed.'
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_partner
        @partner = Partner.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def partner_params
        params.require(:partner).permit(:name, :site, :phone, :address, :coordinates, :city_ukr, :city_mold, :active)
      end
  end
end
