require_dependency "iteasykit/application_controller"

module Iteasykit
  class Admin::FcisController < Admin::AdminController
    before_action :set_fci, only: [:show, :edit, :update, :destroy, :destroy_fields]

    # GET /fcis
    def index
      @fcis = Fci.all
    end

    # GET /fcis/1
    def show
    end

    def destroy_fields
      field = params[:relabletype].constantize.find(params[:delfield].to_i)
      field.destroy!
      redirect_back(fallback_location: root_path)
    end

    # GET /fcis/new
    def new
      @fci = Fci.new
    end

    # GET /fcis/1/edit
    def edit
    end

    # POST /fcis
    def create
      @fci = Fci.new(fci_params)

      if @fci.save
        redirect_back(fallback_location: root_path)
      else
        render :new
      end
    end

    # PATCH/PUT /fcis/1
    def update
      if @fci.update(fci_params)
        redirect_back(fallback_location: root_path)
      else
        render :edit
      end
    end

    # DELETE /fcis/1
    def destroy
      @fci.destroy
      redirect_back(fallback_location: root_path)
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_fci
        @fci = Fci.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def fci_params
        params.require(:fci).permit(:name, :help, :placeholder, :value, :prefix, :suffix, :elementcls, :idcls, :classcls,
                                    :machine_name, :active, :is_required, :position, :is_filter, :is_multi, :fciable_type,
                                    :fciable_id, :type_fci)
      end
  end
end
