require "uri"
require "net/http"

module Bilda
    class Content

        def initialize(id)
          @id = id
        end

        #metodo que decide si crear un registro o actualizarlo
        def defineStatus
            @property = PropertyInformations.where(id:@id)
            
            if @property != nil
                id_bilda = @property[0].id_bilda 
                if id_bilda == nil
                    create_field
                else
                    update_field(id_bilda)
                end
            else
                return nil
            end

        end 

        #metodos privados
        private 

        def create_field
            
            url = URI("https://api.duda.co/api/sites/multiscreen/14557a2c/collection/publishing/row")

            https = Net::HTTP.new(url.host, url.port)
            https.use_ssl = true

            request = Net::HTTP::Post.new(url)
            request["Content-Type"] = "application/json"
            request["Authorization"] = "Basic ZDIzOTYwYmY1MTpaRnlqQTVzVzdYSW8="
            request.body = JSON.dump([
            {
                "data": {
                "name_es": @property[0].name,
                "name_en": @property[0].english_name,
                "address": @property[0].address,
                "colony": @property[0].colony,
                "street": @property[0].state,
                "mun": @property[0].municipality
                }
            }
            ])

            response = https.request(request)
            jsonResponse = JSON.parse(response.read_body)
            if jsonResponse[0]["id"]
               return updateProperty(jsonResponse[0]["id"])
            else
                return false
            end

        end

        def update_field(id_bilda)
            url = URI("https://api.duda.co/api/sites/multiscreen/14557a2c/collection/publishing/row")

            https = Net::HTTP.new(url.host, url.port)
            https.use_ssl = true

            request = Net::HTTP::Put.new(url)
            request["Accept"] = "application/json"
            request["Content-Type"] = "application/json"
            request["Authorization"] = "Basic ZDIzOTYwYmY1MTpaRnlqQTVzVzdYSW8="
            request.body = JSON.dump([
            {
                "id": id_bilda,
                "data": {
                    "name_es": @property[0].name,
                    "name_en": @property[0].english_name,
                    "address": @property[0].address,
                    "colony": @property[0].colony,
                    "street": @property[0].state,
                    "mun": @property[0].municipality
                }
            }
            ])

            response = https.request(request)
            return true
        end
        
        # en dado caso que se cree bien el campo actualizamos en base de datos
        def updateProperty(id_bildas) 
            if @property.update(id_bilda: id_bildas)
                return true
            else
                return false
            end

        end
    end
end