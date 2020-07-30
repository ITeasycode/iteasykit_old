require_dependency "iteasykit/application_controller"

module Iteasykit
  class Admin::MenusController < Admin::AdminController
    before_action :set_menu, only: [:show, :edit, :update, :destroy, :manage]
    include SortableTreeController::Sort
    sortable_tree 'Iteasykit::MenuItem', {sorting_attribute: 'position', parent_method: 'parent'}
    # GET /menus
    def index
      @menus = Menu.all
    end

    # GET /menus/1
    def show
      @items = Iteasykit::MenuItem.all.arrange(:order => :position)
    end

    # GET /menus/new
    def new
      @menu = Menu.new
    end

    # GET /menus/1/edit
    def edit
      @menu_item = MenuItem.new
      @items = @menu.menu_items.arrange(:order => :position)

    end

    # POST /menus
    def create
      @menu = Menu.new(menu_params)

      if @menu.save
        redirect_to edit_admin_menu_url(@menu), notice: 'Menu was successfully created.'
      else
        render :new
      end
    end

    # PATCH/PUT /menus/1
    def update

      if @menu.update(menu_params)
        redirect_to edit_admin_menu_url(@menu), notice: 'Menu was successfully updated.'
      else
        render :edit
      end
    end

    # DELETE /menus/1
    def destroy
      @menu.destroy
      redirect_to admin_menus_url, notice: 'Menu was successfully destroyed.'
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_menu
        @menu = Menu.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def menu_params
        params.require(:menu).permit(:name, :description, :active, :machine_name, :elementcls, :idcls, :csscls)
      end
  end
end
