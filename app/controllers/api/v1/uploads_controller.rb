class Api::V1::UploadsController < ApplicationController

    def index
        uploadResource = Upload::Image.new("https://res.cloudinary.com/ampipspace/image/upload/v1632757968/AMPIP/oqv07uh8wlobe80ahmze.png").call;
        render json: uploadResource
    end

    def create 
        imagen = params[:url]
        uploadResource = Upload::Image.new(imagen).call;
        render json: {url: uploadResource}

    end


    

end
