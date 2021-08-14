#no se usara este servicio
module Maps
    class MainMaps

        def initialize(params)
          @params = params
        end

        def call
            if @params[:type] == "get"
               return getMaps
            end
        end

        private

        def getMaps
            map = Map.all
            return Map
        end

    end
end