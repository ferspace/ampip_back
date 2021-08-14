class Api::V1::UserChangesSerializer < Api::V1::ApplicationSerializer
    attributes  :id,
                :previews_value,
                :next_value
end