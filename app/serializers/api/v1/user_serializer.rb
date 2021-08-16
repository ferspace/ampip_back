class Api::V1::UserSerializer < Api::V1::ApplicationSerializer
    attributes  :id,
                :email,
                :user_type
end
