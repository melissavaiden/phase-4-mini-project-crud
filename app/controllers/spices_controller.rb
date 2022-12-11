class SpicesController < ApplicationController

    def index
        spices = Spice.all
        render json: spices, status: :ok
    end

    def show
        spice = Spice.find(params[:id])
        render json: spice, status: :ok
    end

    def create
        spice = Spice.create(spice_params)
        render json: spice, status: :created
    end

    def update
        spice = Spice.find(params[:id])
        spice.update(spice_params)
        render json: spice, status: :ok
    end

    def destroy
        spice = Spice.find(params[:id])
        spice.destroy
        render json: spice, status: :not_found
    end

    private

    # def spice_find
    #     Spice.find(params[:id])
    # end

    def spice_params
        params.permit(:title, :image, :description, :notes, :rating)
    end
end
