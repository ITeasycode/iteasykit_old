require_dependency "iteasykit/application_controller"

module Iteasykit
  class Admin::FormsController < Admin::AdminController
    before_action :set_form, only: [:show, :edit, :update, :destroy]

    # GET /forms
    def index
      @forms = Form.all
    end

    # GET /forms/1
    def show
    end

    # GET /forms/new
    def new
      @entity_type = Iteasykit::EntityType.find(params[:entity_type])
      @form = Form.new
      @group_list = Iteasykit::Form.all.map { |e| e.group }.uniq
    end

    # GET /forms/1/edit
    def edit
      @group_list = Iteasykit::Form.all.map { |e| e.group }.uniq
    end

    # POST /forms
    def create
      @form = Form.new(form_params)

      if @form.save
        fci_saver(@form, params)
        redirect_back(fallback_location: root_path)
      else
        render :new
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
      id = @form.iteasykit_entity_type_id
      @form.destroy
      redirect_to "/admin/entity_types/#{id}"
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_form
      @form = Form.find(params[:id])
      @entity_type = @form.iteasykit_entity_type
    end

    # Only allow a trusted parameter "white list" through.
    def form_params
      params.require(:form).permit(:iteasykit_entity_type_id, :active, :sticky, :position, :group, :machine_name, :iteasykit_seomore_id, :slug, :calc)
    end
  end
end
