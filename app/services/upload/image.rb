require "uri"
require "net/http"


module Upload
    class Image
        
        def initialize(params)
            @image = params
        end
  
        def call
            url = URI("https://api.duda.co/api/sites/multiscreen/resources/14557a2c/upload")
            https = Net::HTTP.new(url.host, url.port)
            
            https.use_ssl = true
            
            request = Net::HTTP::Post.new(url)
            request["Authorization"] = "Basic ZDIzOTYwYmY1MTpaRnlqQTVzVzdYSW8="
            request["Content-Type"] = "application/json"
            request["Cookie"] = "JSESSIONID=A8C788CB89C85842F385754F023D781D-n2"
            request.body = JSON.dump([
            {
                "resource_type": "IMAGE",
                "src": @image
            }
            ])

            response = https.request(request)
            if JSON.parse(response.read_body)["n_failures"] == 0 
                return JSON.parse(response.read_body)["uploaded_resources"][0]["new_url"]
            else
                return false
            end

            
        end

    end
end