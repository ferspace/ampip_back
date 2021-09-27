class Api::V1::StatusDisponibilitiesExtraController < ApplicationController
    
    def update
        id = params[:id]
        disponibility = StatusDisponibility.where(id:id)
        status = params[:status]
        if disponibility.update(status_property:status)
            render json:{"message":"guardado"}
        else
            render json:{"message":"error"}
        end

    end

end
