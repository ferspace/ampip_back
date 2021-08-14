class Api::V1::MapsController < ApplicationController
    
    def index
        maps = Map.all
        render json: maps, each_serializer: Api::V1::MapsSerializer
    end

    def show
        maps_info = MapInformation.find(params[:id])
        render json: maps_info, each_serializer: Api::V1::MapsSerializer
    end

    def create
        newMap = Map.new permit_params
        if newMap.save
            render json:{"message":"guardado"}
        else
            render json:{"message":"error"}
        end
    end

    def update
        updateMaps = MapInformation.find(params[:id])
        if updateMaps.update(permit_params)
            render json:{"message":"guardado"}
        else
            render json:{"message":updateMaps.errors.full_messages}
        end
    end

    private 
    
    def permit_params 
        params.require(:maps).permit(:id, :name, :lat, :lng, :details)
    end

end
