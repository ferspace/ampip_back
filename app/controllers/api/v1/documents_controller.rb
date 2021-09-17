class Api::V1::DocumentsController < ApplicationController
    
    def index
        documents = Document.all
        render json: documents, each_serializer: Api::V1::DocumentSerializer
    end

    def show
        documents = Document.find(params[:id])
        render json: documents, each_serializer: Api::V1::DocumentSerializer
    end

    def create
        document = Document.new permit_params
        if document.save
            render json:{"message": "Guardado"}
        else
            render json:{"mensage": documt.errors.full_messages}
        end
    end

    def update
        updateDocument = Document.find(params[:id])
        if updateDocument.update(permit_params)
            render json:{"message":"guardado"}
        else
            render json:{"message":updateDocument.errors.full_messages}
        end
    end

    private 
    
    def permit_params 
        params.require(:document).permit(:name, :url, :detail)
    end

end