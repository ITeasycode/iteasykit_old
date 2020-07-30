<<<<<<< HEAD
require_dependency 'iteasykit/application_controller'

module Iteasykit
  class FormsController < ApplicationController
    before_action :set_form, only: %i[show edit update destroy]
=======
require_dependency "iteasykit/application_controller"

module Iteasykit
  class FormsController < ApplicationController
    before_action :set_form, only: [:show, :edit, :update, :destroy]
>>>>>>> da5d6b72830a0014e83c8edcc709afe275c69b23

    # GET /forms
    def index
      @forms = Form.all
    end

    # GET /forms/1
<<<<<<< HEAD
    def show; end
=======
    def show
    end
>>>>>>> da5d6b72830a0014e83c8edcc709afe275c69b23

    # GET /forms/new
    def new
      @form = Form.new
    end

    # GET /forms/1/edit
<<<<<<< HEAD
    def edit; end
=======
    def edit
    end
>>>>>>> da5d6b72830a0014e83c8edcc709afe275c69b23

    # POST /forms
    def create
      @form = Form.new(form_params)

      if @form.save
        fci_saver(@form, params)
<<<<<<< HEAD
        request.headers['Referer'] = request.headers['Referer'] + '?answer=success'
        redirect_back fallback_location: root_path
      else
        redirect_back fallback_location: root_path
=======
        request.headers["Referer"] = request.headers["Referer"]+'?answer=success'
        redirect_back fallback_location: root_path
      else
        render :new
>>>>>>> da5d6b72830a0014e83c8edcc709afe275c69b23
      end
    end

    # PATCH/PUT /forms/1
    def update
      if @form.update(form_params)
        fci_saver(@form, params)
        redirect_back(fallback_location: root_path)
      else
        render :edit
      end
    end

    # DELETE /forms/1
    def destroy
      @form.destroy
      redirect_to forms_url, notice: 'Form was successfully destroyed.'
    end

    private
<<<<<<< HEAD

    # Use callbacks to share common setup or constraints between actions.
    def set_form
      @form = Form.find(params[:id])
      @entity_type = @form.iteasykit_entity_type
    end

    # Only allow a trusted parameter "white list" through.
    def form_params
      params.require(:form).permit(:iteasykit_entity_type_id, :active, :sticky, :position, :group,
         :machine_name, :iteasykit_seomore_id, :slug, :calc, :humanizer_answer, :humanizer_question_id)
    end
=======
      # Use callbacks to share common setup or constraints between actions.
      def set_form
        @form = Form.find(params[:id])
        @entity_type = @form.iteasykit_entity_type
      end

      # Only allow a trusted parameter "white list" through.
      def form_params
        params.require(:form).permit(:iteasykit_entity_type_id, :active, :sticky, :position, :group, :machine_name, :iteasykit_seomore_id, :slug, :calc)
      end
>>>>>>> da5d6b72830a0014e83c8edcc709afe275c69b23
  end
end
