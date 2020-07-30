require_dependency "iteasykit/application_controller"

module Iteasykit
  class Admin::MenuItemsController < Admin::AdminController
    before_action :set_menu_item, only: [:show, :edit, :update, :destroy]
    include SortableTreeController::Sort
    sortable_tree 'Iteasykit::MenuItem', {sorting_attribute: 'position', parent_method: 'parent'}

    # GET /menus
    def index
      @menus = MenuItem.all
    end

    # GET /menus/1
    def show
    end


    def manage
      # get items to show in tree
      @items = Iteasykit::MenuItem.all.arrange(:order => :ancestry)

    end
    # GET /menus/new
    def new
      @menu_item = MenuItem.new
    end

    # GET /menus/1/edit
    def edit
    end

    # POST /menus
    def create
      @menu_item = MenuItem.new(menu_item_params)

      if @menu_item.save
        redirect_to edit_admin_menu_url(@menu_item.iteasykit_menu), notice: 'Menu was successfully created.'
      else
        render :new
      end
    end

    # PATCH/PUT /menus/1
    def update

      if @menu_item.update(menu_item_params)
        redirect_to edit_admin_menu_url(@menu_item.iteasykit_menu), notice: 'Menu was successfully updated.'
      else
        render :edit
      end
    end

    # DELETE /menus/1
    def destroy
      menu = @menu_item.iteasykit_menu
      @menu_item.destroy
      redirect_to  edit_admin_menu_url(menu), notice: 'Menu was successfully destroyed.'
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_menu_item
        @menu_item = MenuItem.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def menu_item_params
        params.require(:menu_item).permit(:name, :title, :url, :ancestry, :ancestry_depth, :elementcls, :idcls, :csscls,
                                          :iteasykit_menu_id, :active, :blocked)
      end
  end
end
