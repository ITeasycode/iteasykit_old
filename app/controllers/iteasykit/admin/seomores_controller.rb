require_dependency "iteasykit/application_controller"

module Iteasykit
  class Admin::SeomoresController < Admin::AdminController
    before_action :set_seomore, only: [:show, :edit, :update, :destroy]

    # GET /seomores
    def index
      @seomores = Seomore.all
    end

    # GET /seomores/1
    def show
    end

    # GET /seomores/new
    def new
      @seomore = Seomore.new
    end

    # GET /seomores/1/edit
    def edit
    end

    # POST /seomores
    def create
      @seomore = Seomore.new(seomore_params)

      if @seomore.save
        redirect_to @seomore, notice: 'Seomore was successfully created.'
      else
        render :new
      end
    end

    # PATCH/PUT /seomores/1
    def update
      if @seomore.update(seomore_params)
        redirect_to @seomore, notice: 'Seomore was successfully updated.'
      else
        render :edit
      end
    end

    # DELETE /seomores/1
    def destroy
      @seomore.destroy
      redirect_to seomores_url, notice: 'Seomore was successfully destroyed.'
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_seomore
        @seomore = Seomore.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def seomore_params
        params.require(:seomore).permit(:noindex, :nofollow, :title, :keywords, :description, :canonical, :author, :publisher, :alternate, :refresh)
      end
  end
end
