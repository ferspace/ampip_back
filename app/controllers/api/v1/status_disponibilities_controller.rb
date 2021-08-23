class Api::V1::StatusDisponibilitiesController < ApplicationController

    def index
        statusDisponibilities = StatusDisponibility.where(status_property:true)
        render json: statusDisponibilities, each_serializer: Api::V1::StatusDisponibilitySerializer
    end

    def show
        statusDisponibilities_info = StatusDisponibility.where(property_informations_id: params[:id])
        if statusDisponibilities_info  != nil
            render json: statusDisponibilities_info, each_serializer: Api::V1::StatusDisponibilitySerializer
        else
            render json:{"message":"no existe", "status":404}
        end 
    end

    def create
        newStatusDisponibilities = StatusDisponibility.new permit_params
        if newStatusDisponibilities.save
            render json:{"message":"guardado"}
        else 
            render json:{"message":newStatusDisponibilities.errors.full_messages}
        end 
    end

    def update
        updateSatusDisponibilities = StatusDisponibility.find(params[:id])
        if updateSatusDisponibilities.update(permit_params)
            render json:{"message":"guardado"}
        else
            render json:{"message":updateSatusDisponibilities.errors.full_messages}
        end
    end

    def destroy

    end

    private

    def permit_params
         params.require(:status_disponibilities).permit(:property_informations_id , :status_property, :average_price, :use)
    end


    
end
