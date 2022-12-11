class SpicesController < ApplicationController

    def index
        spices = Spice.all
        render json: spices, status: :ok
    end

    def show
        spice = spice_find
        render json: spice, status: :ok
    end

    def create
        spice = Spice.create(spice_params)
        render json: spice, status: :created
    end

    def update
        spice = spice_find
        spice.update(spice_params)
        render json: spice, status: :ok
    end

    def destroy
        spice = spice_find
        spice.destroy
        render json: spice, status: :not_found
    end

    private

    def spice_find
        Spice.find(params[:id])
    end

    def spice_params
        params.permit(:title, :image, :description, :notes, :rating)
    end
end
