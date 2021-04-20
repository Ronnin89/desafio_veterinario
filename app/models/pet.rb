class Pet < ApplicationRecord
    has_many :pet_histories, dependent: :destroy
end
