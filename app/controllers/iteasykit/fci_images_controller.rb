require_dependency "iteasykit/application_controller"

module Iteasykit
  class FciImagesController < ApplicationController
    before_action :set_fci_image, only: [:show, :edit, :update, :destroy]


    def show
    end


    def edit
    end


    def update
        if @fci_image.update(fci_image_params)
          redirect_to @fci_image
        else
          render :edit
        end
    end

    def destroy
    end


    private
    # Use callbacks to share common setup or constraints between actions.
    def set_fci_image
      @fci_image = FciImage.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def fci_image_params
      params.require(:fci_image).permit(:title, :alt)
    end
end
end
