class Api::V1::ContactsController < ApplicationController

    def index
        contacts = Contact.all
        render json: contacts, each_serializer: Api::V1::ContactSerializer
    end

    def show
        contacts_info = Contact.where(property_informations_id:params[:id])
        render json: contacts_info, each_serializer: Api::V1::ContactSerializer
    end

    def create
        newContact = Contact.new permit_params
        if newContact.save 
            render json:{"message":"guardado"}
        else
            render json:{"message":newContact.errors.full_messages}
        end
    end

    def update
        updateContact = ContactInformation.find(params[:id])
        if updateContact.update(permit_params)
            
            render json:{"message":"guardado"}
        else
            render json:{"message":updateContact.errors.full_messages}
        end
    end

    def destroy

    end

    private

    def permit_params
         params.require(:contact).permit(:property_informations_id, :name, :phone_number, :website)
    end

end
