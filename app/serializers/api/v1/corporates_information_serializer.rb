class Api::V1::CorporatesInformationSerializer < Api::V1::ApplicationSerializer
    attributes  :id,
                :rfc,
                :social_media_tw,
                :social_media_fb,
                :social_media_inst,
                :social_media_link,
                :social_media_web,
                :corporate_id,
                :created_at,
                :updated_at
            
                
end
